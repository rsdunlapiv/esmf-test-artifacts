#!/bin/sh -l
#SBATCH --account=nems
#SBATCH -o /home/role.esmfmaint/scratch/tmp-test/gfortran_9.2.0a_mpiuni_O_develop/build.bat_%j.o
#SBATCH -e /home/role.esmfmaint/scratch/tmp-test/gfortran_9.2.0a_mpiuni_O_develop/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load gnu/9.2.0 
module load netcdf/4.7.2

set -x
tar xvfz ~/pytest-input.tar.gz
export ESMF_DIR=/home/role.esmfmaint/scratch/tmp-test/gfortran_9.2.0a_mpiuni_O_develop/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/home/role.esmfmaint/scratch/tmp-test/gfortran_9.2.0a_mpiuni_O_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /home/role.esmfmaint/scratch/tmp-test/gfortran_9.2.0a_mpiuni_O_develop/module-build.log
cd /home/role.esmfmaint/scratch/tmp-test/gfortran_9.2.0a_mpiuni_O_develop/esmf
make info 2>&1| tee ../info.log
make -j 40 2>&1| tee ../build.log
