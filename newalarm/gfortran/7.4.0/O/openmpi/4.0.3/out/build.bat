#!/bin/sh -l
#PBS -N build.bat
#PBS -l walltime=1:00:00
#PBS -q regular
#PBS -A p93300606
#PBS -l select=1:ncpus=36:mpiprocs=36
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load gnu/7.4.0 openmpi/4.0.3
module load netcdf/4.7.3

set -x
export var1
export ESMF_DIR=/glade/scratch/dunlap/esmf-test-dev/gfortran_7.4.0_openmpi_O_newalarm/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /glade/scratch/dunlap/esmf-test-dev/gfortran_7.4.0_openmpi_O_newalarm/module-build.log
cd /glade/scratch/dunlap/esmf-test-dev/gfortran_7.4.0_openmpi_O_newalarm/esmf
make info 2>&1| tee ../info.log
make -j 36 2>&1| tee ../build.log
