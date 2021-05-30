
/**
* Copyright (C) 2020 Xilinx, Inc
*
* Licensed under the Apache License, Version 2.0 (the "License"). You may
* not use this file except in compliance with the License. A copy of the
* License is located at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
* WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
* License for the specific language governing permissions and limitations
* under the License.
*/
/*****************************************************************************************
*  GUI Flow :
*
*  By default this example supports 1DDR execution in GUI mode for
*  all the XSAs. To make this example to work with multi DDR XSAs
*  please follow steps mentioned below.
*
*  ***************************************************************************************
*  XSA  (2DDR):
*
*  1. Add a .cfg file in the <Project>/src folder with the following entries:
*  	    [Connecttivity]
*  	    sp=bandwidth_1.m_axi_gmem0:DDR[0]
*     	    sp=bandwidth_1.m_axi_gmem1:DDR[1]
*
*     For more number of DDR connections add more sp tags as shown above in the
*cfg file.
*     Note : Replace DDR[0] with HP0, DDR[1] with HP1 for embedded platforms(zc)
*  2.<Vitis Project> > Properties > C/C++ Build > Settings > Vitis V++ Kernel
*Linker
*                  > Miscellaneous > Other flags
*     --config ../src/<config_file>.cfg
*  3. Default number of banks for CLI flow is 2 banks, for GUI flow is 1 bank.
*     For 3 or 4 DDR connections, "#define NDDR_BANKS <3 or 4>" at the top of
*kernel.cpp
* *****************************************************************************************
*
*  CLI Flow:
*
*  In CLI flow makefile detects the DDR of a device on the basis of ddr_banks
*variable in config.mk file
*  and based on that automatically it adds all the flags that are necessary.
*This example can be
*  used similar to other examples in CLI flow, extra setup is not needed.
*
*********************************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <vector>
#include "xcl2.hpp"
#include "copy_kernel.h"


#ifndef NDDR_BANKS
#define NDDR_BANKS 1
#endif

/////////////////////////////////////////////////////////////////////////////////
size_t getFilesize(const char* filename) {
    struct stat st;
    if(stat(filename, &st) != 0) {
        return 0;
    }
    return st.st_size;   
}

/////////////////////////////////////////////////////////////////////////////////

int main(int argc, char** argv) {

	if (argc != 2) {
        std::cout << "Usage: " << argv[0] << " <XCLBIN File>" << std::endl;
        return EXIT_FAILURE;
    }
	

std::string binaryFile = argv[1];

    cl_int err;
    cl::CommandQueue q;
    cl::Context context;
    cl::Kernel bandwidth;
    auto devices = xcl::get_xil_devices();
    // read_binary_file() is a utility API which will load the binaryFile
    // and will return the pointer to file buffer.
    auto fileBuf = xcl::read_binary_file(binaryFile);
    cl::Program::Binaries bins{{fileBuf.data(), fileBuf.size()}};
    bool valid_device = false;
    for (unsigned int i = 0; i < devices.size(); i++) {
        auto device = devices[i];
        // Creating Context and Command Queue for selected Device
        OCL_CHECK(err, context = cl::Context(device, nullptr, nullptr, nullptr, &err));
        OCL_CHECK(err, q = cl::CommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE, &err));

        std::cout << "Trying to program device[" << i << "]: " << device.getInfo<CL_DEVICE_NAME>() << std::endl;
        cl::Program program(context, {device}, bins, nullptr, &err);
        if (err != CL_SUCCESS) {
            std::cout << "Failed to program device[" << i << "] with xclbin file!\n";
    	} else {
            std::cout << "Device[" << i << "]: program successful!\n";
            OCL_CHECK(err, bandwidth = cl::Kernel(program, "bandwidth", &err));
            valid_device = true;
            break; // we break because we found a valid device
        }
    }
    if (!valid_device) {
        std::cout << "Failed to program any device found, exit!\n";
        exit(EXIT_FAILURE);
    }


    size_t globalbuffersize  = DATA_SIZE;
    size_t globaloutputsizeB = OUTPUT_SIZEB;
    size_t globaloutputsize  = 0 + globaloutputsizeB;

    unsigned int total_bytes = getFilesize(argv[1]); printf("Input file %s has %d bytes,\n", argv[1], total_bytes);

    //variables for profiling
    struct timeval start_tin, end_tin, start_tout, end_tout, start_t1, end_t1, start_t2, end_t2;
    float tin, tout, t1, t2;
	
    /* Input buffer */
    unsigned char *input_host = ((unsigned char *)malloc(globalbuffersize));
    if(input_host== nullptr) {
        printf("Error: Failed to allocate host side copy of OpenCL source buffer of size %ld\n",globalbuffersize);
        return EXIT_FAILURE;
    }
    else
        printf("Allocated host side copy of OpenCL source buffer of size %ld\n",globalbuffersize);

	//output buffer
    unsigned char *output_host = ((unsigned char *)malloc(globaloutputsize));
    if(output_host==NULL) {
        printf("Error: Failed to allocate host side copy of OpenCL output buffer of size %ld\n",globaloutputsize);
        return EXIT_FAILURE;
    }
    else
        printf("Allocated host side copy of OpenCL output buffer of size %ld\n",globaloutputsize);
	
    unsigned int i;

    for(i=0; i<globalbuffersize; i++){
		unsigned int imod = i%256;
		switch(imod)
		{
			case 0:
			    input_host[i]='a';
				break;
			case 1:
			    input_host[i]='b';
				break;
			case 2:
			    input_host[i]='a';
				break;
			case 3:
			    input_host[i]='a';
				break;
			case 4:
			    input_host[i]='b';
				break;
			case 5:
			    input_host[i]='e';
				break;
			case 6:
			    input_host[i]='a';
				break;
			case 7:
			    input_host[i]='b';
				break;
			default:
			    input_host[i]='v';
		}
    }

    short ddr_banks = NDDR_BANKS; printf("Total_DDR_Banks = %d\n", ddr_banks);
 
    cl::Buffer* input_buffer;
#ifdef USE_NDDR
    cl_mem_ext_ptr_t input_buffer_ext;
    input_buffer_ext.flags = XCL_MEM_DDR_BANK0;
    input_buffer_ext.obj = NULL;
    input_buffer_ext.param = 0;

    input_buffer = new cl::Buffer (context,
                                  CL_MEM_READ_WRITE | CL_MEM_EXT_PTR_XILINX,
                                  globalbuffersize,
                                  &input_buffer_ext,
                                  &err);
    if(err != CL_SUCCESS) {
        printf("Error: Failed to allocate OpenCL source buffer of size %ld on bank %d\n", globalbuffersize, XCL_MEM_DDR_BANK0);
        return EXIT_FAILURE;
    }
    else
        printf("Allocated OpenCL source buffer of size %ld on bank %d\n", globalbuffersize, XCL_MEM_DDR_BANK0);
#else
    input_buffer = new cl::Buffer (context,
                                  CL_MEM_READ_WRITE,
                                  globalbuffersize,
                                  NULL,
                                  &err);
    if(err != CL_SUCCESS) {
        printf("Error: Failed to allocate OpenCL source buffer of size %ld\n", globalbuffersize);
        return EXIT_FAILURE;
    }
    else
        printf("Allocated OpenCL source buffer of size %ld\n", globalbuffersize);
#endif

    //output buffer
    cl::Buffer* output_buffer0;
#ifdef USE_NDDR
    cl_mem_ext_ptr_t output_buffer0_ext;
    output_buffer0_ext.flags = XCL_MEM_DDR_BANK1;
    output_buffer0_ext.obj = NULL;
    output_buffer0_ext.param = 0;

    output_buffer0 = new cl::Buffer(context,
                                   CL_MEM_READ_WRITE | CL_MEM_EXT_PTR_XILINX,
                                   globaloutputsizeB,
                                   &output_buffer0_ext,
                                   &err);
    if (err != CL_SUCCESS) {
        printf("Error: Failed to allocate OpenCL output buffer of size %ld on bank %d\n", globaloutputsizeB, XCL_MEM_DDR_BANK1);
        return EXIT_FAILURE;
    }
    else
        printf("Allocated OpenCL output buffer of size %ld on bank %d\n", globaloutputsizeB, XCL_MEM_DDR_BANK1);

#else
    output_buffer0 = new cl::Buffer(context,
                                   CL_MEM_READ_WRITE,
                                   globaloutputsizeB,
                                   NULL,
                                   &err);
    if (err != CL_SUCCESS) {
        printf("Error: Failed to allocate OpenCL output buffer of size %ld\n", globaloutputsizeB);
        return EXIT_FAILURE;
    }
    else
        printf("Allocated OpenCL output buffer of size %ld\n", globaloutputsizeB);

#endif

    
    double dbytes = globalbuffersize;
    double dmbytes = dbytes / (((double)1024) * ((double)1024));
    printf("Starting kernel to read/write %.0lf MB bytes from/to global memory... \n", dmbytes);

    gettimeofday(&start_tin, NULL);
	
    /* Write input buffer */
    /* Map input buffer for PCIe write */
    unsigned char *map_input_buffer;
    map_input_buffer = (unsigned char *) q.enqueueMapBuffer( *input_buffer,
                                                             CL_FALSE,
                                                             CL_MAP_WRITE_INVALIDATE_REGION,
                                                             0,
                                                             globalbuffersize,
                                                             nullptr,
                                                             nullptr,
                                                             &err);
    if (err != CL_SUCCESS) {
        printf("Error: Failed to EnqueueMapBuffer OpenCL buffer\n");
        return EXIT_FAILURE;
    } else {
        printf("SUCCESS: Allocated input buffer memory.\n");
    }
    q.finish();

    /* Prepare data to be written to the device */
    memcpy(map_input_buffer, input_host, globalbuffersize);

    err = q.enqueueUnmapMemObject(*input_buffer,
                                  map_input_buffer);
    if (err != CL_SUCCESS) {
        printf("Error: Failed to copy input dataset to OpenCL buffer\n");
        return EXIT_FAILURE;
    } else {
        printf("SUCCESS: Copied input data to input buffer.\n");
    }
    q.finish();

    gettimeofday(&end_tin, NULL);

	unsigned long start, end, nsduration1, nsduration2;
    cl::Event event;
	
    /* Execute kernel */
	int arg_index = 0;
	printf("Starting kernel execution.\n");
 	OCL_CHECK(err, err = bandwidth.setArg(arg_index++, *input_buffer));
    OCL_CHECK(err, err = bandwidth.setArg(arg_index++, *output_buffer0));
	
    gettimeofday(&start_t1, NULL);
   
    OCL_CHECK(err, err = q.enqueueTask(bandwidth, nullptr, &event));
    OCL_CHECK(err, err = event.wait());
    end = OCL_CHECK(err, event.getProfilingInfo<CL_PROFILING_COMMAND_END>(&err));
    start = OCL_CHECK(err, event.getProfilingInfo<CL_PROFILING_COMMAND_START>(&err));
    nsduration1 = end - start;
    gettimeofday(&end_t1, NULL);
	
    gettimeofday(&start_t2, NULL);

    nsduration2 = 0;

    gettimeofday(&end_t2, NULL);

    gettimeofday(&start_tout, NULL);
   
    /* Copy results back from OpenCL buffer */
    unsigned char *map_output_buffer0;
    map_output_buffer0 = (unsigned char *)q.enqueueMapBuffer(
                                                             *output_buffer0,
                                                             CL_FALSE,
                                                             CL_MAP_READ,
                                                             0,
                                                             globaloutputsizeB,
                                                             nullptr,
                                                             nullptr,
                                                             &err);
    if (err != CL_SUCCESS) {
        printf("ERROR: Failed to read output size buffer %d\n", err);
        return EXIT_FAILURE;
    } else {
        printf("SUCCESS: Read output buffer.\n");
    }
    q.finish();

    memcpy(output_host, map_output_buffer0, globaloutputsizeB);

    err = q.enqueueUnmapMemObject( *output_buffer0,
                                  map_output_buffer0
                                  );
    if (err != CL_SUCCESS) {
        printf("Error: Failed to copy output from OpenCL buffer\n");
        return EXIT_FAILURE;
    } else {
        printf("SUCCESS: Copied output data into local memory.\n");
    }
    q.finish();

    gettimeofday(&end_tout, NULL);
   
    /* Check the results */
   /*for(i=0; i<50; i++){
		printf("Cycle %d, Symbol %c, Result vector%d:\n", i+1, input_host[i], output_host[i]);
		printf("       Matched rules: ");
		for(unsigned int offset=0; offset<8; offset++){
		   unsigned char val = (output_host[i] >> offset) & (0x01);
	       if (val)
	          printf("%d  ", offset+1);
        }
		printf("\n");
    }*/
    /*for(i=0; i<2624; i++){//first 2624 bytes (or cycles)
        bool match = false;
        for(unsigned int k=0; k<FACTORB; k++){
            if (output_host[i*FACTORB + k] != 0) {match = true; break;}
        }
        if (match) {
            printf("Cycle %d, input %c:\n", i, input_host[i]);
            printf("        Rules: ");
            for(unsigned int k=0; k<FACTORB; k++){
                for(unsigned int offset=0; offset<8; offset++) {
                    unsigned char val = (output_host[i*FACTORB + k] >> offset) & (0x01);
                    if(val) printf("%d  ", k*8 + offset+1);
                }
            }
            printf("\n");
        }
    }*/
	
    /* Profiling information */
    double dnsduration1 = ((double)nsduration1);
    double dsduration1 = dnsduration1 / ((double) 1000000000);

    double bpersec1 = (dbytes/dsduration1);
    double mbpersec1 = bpersec1 / ((double) 1024*1024 );

    double dnsduration2 = ((double)nsduration2);
    double dsduration2 = dnsduration2 / ((double) 1000000000);

    double bpersec2 = (dbytes/dsduration2);
    double mbpersec2 = bpersec2 / ((double) 1024*1024 );
	
    t1 = (end_t1.tv_sec + end_t1.tv_usec/(double)(1000000)) - (start_t1.tv_sec + start_t1.tv_usec/(double)(1000000));
    t2 = (end_t2.tv_sec + end_t2.tv_usec/(double)(1000000)) - (start_t2.tv_sec + start_t2.tv_usec/(double)(1000000));
	
    double bpersec1_ = (dbytes/t1);
    double mbpersec1_ = bpersec1_ / ((double) 1024*1024 );
    double bpersec2_ = (dbytes/t2);
    double mbpersec2_ = bpersec2_ / ((double) 1024*1024 );
	
    printf("Kernel completed read/write %.0lf MB bytes from/to global memory.\n", dmbytes);
    printf("clGetEventProfilingInfo - Execution time = %f (sec), %f (sec)\n", dsduration1, dsduration2);
    printf("clGetEventProfilingInfo - Concurrent Read and Write Throughput = %f (MB/sec), %f (MB/sec)\n", mbpersec1, mbpersec2);
    printf("\n");
    printf("gettimeofday - Execution time = %f (sec), %f (sec)\n", t1, t2);
    printf("gettimeofday - Concurrent Read and Write Throughput = %f (MB/sec), %f (MB/sec)\n", mbpersec1_, mbpersec2_);
    printf("\n");
    printf("Overhead of kernel call = %f(sec), %f(sec)\n", t1 - dsduration1, t2 - dsduration2 );

    tin = (end_tin.tv_sec  + end_tin.tv_usec/(double)(1000000))  - (start_tin.tv_sec  + start_tin.tv_usec/(double)(1000000));
    tout= (end_tout.tv_sec + end_tout.tv_usec/(double)(1000000)) - (start_tout.tv_sec + start_tout.tv_usec/(double)(1000000));

    double bpersec_in = (dbytes/tin);
    double mbpersec_in = bpersec_in / ((double) 1024*1024 );
    double bpersec_out = (dbytes/tout);
    double mbpersec_out = bpersec_out / ((double) 1024*1024 );

    printf("\n");
    printf("gettimeofday - Transfer_in time = %f (sec); Transfer_out time = %f (sec) \n", tin, tout);
    printf("gettimeofday - Transfer_in Throughput = %f (MB/sec); Transfer_out Throughput = %f (MB/sec) \n", mbpersec_in, mbpersec_out);
	
    free(input_host);
    free(output_host);
	
    return EXIT_SUCCESS;
}
