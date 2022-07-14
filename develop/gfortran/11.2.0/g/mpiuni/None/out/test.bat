#!/bin/bash -l
export JOBID=NO_BATCH
module use /project/esmf/stack/modulefiles/compilers
module load gcc/11.2.0 
module load netcdf/4.7.4

set -x
export ESMF_NETCDF=nc-config
export ESMF_MPILAUNCHOPTIONS=--oversubscribe
export ESMF_DIR=/project/esmf/rocky/esmf-test-dev/gfortran_11.2.0_mpiuni_g_develop/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/project/esmf/rocky/esmf-test-dev/gfortran_11.2.0_mpiuni_g_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /project/esmf/rocky/esmf-test-dev/gfortran_11.2.0_mpiuni_g_develop/module-test.log
cd /project/esmf/rocky/esmf-test-dev/gfortran_11.2.0_mpiuni_g_develop/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
