#!/bin/bash -l
export JOBID=NO_BATCH
module use /project/esmf/stack/modulefiles/compilers
module load gcc/11.2.0 openmpi/4.1.0
module load netcdf/4.7.4

set -x
export ESMF_NETCDF=nc-config
export ESMF_MPILAUNCHOPTIONS=--oversubscribe
export ESMF_DIR=/project/esmf/rocky/esmf-test-dev/gfortran_11.2.0_openmpi_O_develop/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /project/esmf/rocky/esmf-test-dev/gfortran_11.2.0_openmpi_O_develop/module-build.log
cd /project/esmf/rocky/esmf-test-dev/gfortran_11.2.0_openmpi_O_develop/esmf
make info 2>&1| tee ../info.log
make -j 4 2>&1| tee ../build.log
