#!/bin/sh
export SYSTEMC_HOME=/opt/systemc
export SYSTEMC_LIBDIR=/opt/systemc/lib
export SYSTEMC_INCLUDE=/opt/systemc/include
export LD_LIBRARY_PATH=$SYSTEMC_LIBDIR:$LD_LIBRARY_PATH
export CXXFLAGS="-std=gnu++11"
verilator -Wall -trace -sc --clk i_clk test.v --exe sc_main.cpp
make -j -C obj_dir/ -f Vtest.mk Vtest
./obj_dir/Vtest
#gtkwave trace.vcd
