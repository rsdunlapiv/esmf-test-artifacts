#!/bin/sh -l
#PBS -N build.bat
#PBS -l walltime=2:00:00
#PBS -q regular
#PBS -A p93300606
#PBS -l select=1:ncpus=36:mpiprocs=36
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load intel/18.0.5 openmpi/3.1.4
module load netcdf/4.6.3

set -x
export ESMF_DIR=/glade/scratch/dunlap/esmf-test-dev/intel_18.0.5_openmpi_O_newalarm/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=openmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /glade/scratch/dunlap/esmf-test-dev/intel_18.0.5_openmpi_O_newalarm/module-build.log
cd /glade/scratch/dunlap/esmf-test-dev/intel_18.0.5_openmpi_O_newalarm/esmf
make info 2>&1| tee ../info.log
make -j 36 2>&1| tee ../build.log
