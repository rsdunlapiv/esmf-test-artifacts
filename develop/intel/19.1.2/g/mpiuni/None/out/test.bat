#!/bin/sh -l
#SBATCH --account=e3sm
#SBATCH -o /global/cscratch1/sd/rsdunlap/esmf-test-dev/intel_19.1.2_mpiuni_g_develop/test.bat_%j.o
#SBATCH -e /global/cscratch1/sd/rsdunlap/esmf-test-dev/intel_19.1.2_mpiuni_g_develop/test.bat_%j.e
#SBATCH --time=3:00:00
#SBATCH -C haswell
#SBATCH --qos=regular
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load intel/19.1.2.254 
module load cray-netcdf/4.6.3.2

set -x
export var1
export var2
export var3
export ESMF_DIR=/global/cscratch1/sd/rsdunlap/esmf-test-dev/intel_19.1.2_mpiuni_g_develop/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/global/cscratch1/sd/rsdunlap/esmf-test-dev/intel_19.1.2_mpiuni_g_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /global/cscratch1/sd/rsdunlap/esmf-test-dev/intel_19.1.2_mpiuni_g_develop/module-test.log
cd /global/cscratch1/sd/rsdunlap/esmf-test-dev/intel_19.1.2_mpiuni_g_develop/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
