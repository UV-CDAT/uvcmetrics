#!/bin/bash

rm $NFSHOME/tmp/*

source $NFSHOME/11_03_15/bin/setup_runtime.sh

/opt/nfs/analysis/spark-1.5.2/bin/pyspark --master spark://198.128.245.179:7077   \
$NFSHOME/uvcmetrics/src/python/frontend/diags.py \
--model path=$NFSHOME/uvcmetrics_test_data/cam_output/,climos=yes \
--obs path=$NFSHOME/uvcmetrics_test_data/obs_atmos/,filter='f_startswith("c_t_NCEP")',climos=yes \
--outputdir $NFSHOME/diagout/ \
--cachepath $NFSHOME/tmp/ \
--package AMWG --sets 8 --seasons ANN --plots yes --vars T  \
> $SPARKOUTPUT