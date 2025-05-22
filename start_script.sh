#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/cat.Xauthority

echo "$(date) - Starting show.py" >>/home/cat/rknn_toolkit_lite2/examples/yolov5_plant/startup.log

source ~/miniconda3/bin/activate
conda activate yolov5
cd ~/rknn_toolkit_lite2/examples/yolov5_plant/
python show.py
