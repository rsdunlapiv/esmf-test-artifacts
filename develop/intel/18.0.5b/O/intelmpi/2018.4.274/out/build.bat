#!/bin/sh -l
#SBATCH --account=nems
#SBATCH -o /home/role.esmfmaint/scratch/tmp-test/intel_18.0.5b_intelmpi_O_develop/build.bat_%j.o
#SBATCH -e /home/role.esmfmaint/scratch/tmp-test/intel_18.0.5b_intelmpi_O_develop/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load intel/18.0.5.274 impi/2018.4.274
module load netcdf-hdf5parallel/4.7.4

set -x
tar xvfz ~/pytest-input.tar.gz
export ESMF_DIR=/home/role.esmfmaint/scratch/tmp-test/intel_18.0.5b_intelmpi_O_develop/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /home/role.esmfmaint/scratch/tmp-test/intel_18.0.5b_intelmpi_O_develop/module-build.log
cd /home/role.esmfmaint/scratch/tmp-test/intel_18.0.5b_intelmpi_O_develop/esmf
make info 2>&1| tee ../info.log
