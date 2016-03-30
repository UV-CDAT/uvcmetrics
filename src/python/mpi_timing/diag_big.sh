#!/bin/bash

#SBATCH --job-name=diag_8 --time=02:00:00

rm $NFSHOME/tmp/*

source $NFSHOME/02_17_16/bin/setup_runtime.sh

mpirun  python $NFSHOME/uvcmetrics/src/python/frontend/diags.py \
--model path=$NFSHOME/timing_study_data/cmip5_css02_model/,climos=no \
--obs   path=$NFSHOME/timing_study_data/cmip5_css02_obs/,climos=no \
--outputdir $NFSHOME/diagout/ \
--package AMWG --sets 8 --seasons ANN --plots yes --vars hur --parallel \
--cachepath $NFSHOME/tmp/ > $SLURMOUTPUT
####SBATCH --exclude=greyworm2,greyworm7
#SBATCH -D /opt/nfs/mcenerney1/slurm_output/big/weak/
#SBATCH --exclude=greyworm2,greyworm7