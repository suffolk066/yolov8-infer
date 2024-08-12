#!/bin/bash
sudo apt-get update && sudo apt-get install python3-pip libopenmpi-dev libopenblas-base libomp-dev -y

pip3 install -U pip
pip3 install ultralytics

pip3 uninstall -y torch torchvision opencv-python

wget https://nvidia.box.com/shared/static/mp164asf3sceb570wvjsrezk1p4ftj8t.whl -O torch-2.3.0-cp310-cp310-linux_aarch64.whl
wget https://nvidia.box.com/shared/static/xpr06qe6ql3l6rj22cu3c45tz1wzi36p.whl -O torchvision-0.18.0a0+6043bc2-cp310-cp310-linux_aarch64.whl
wget https://nvidia.box.com/shared/static/48dtuob7meiw6ebgfsfqakc9vse62sg4.whl -O onnxruntime_gpu-1.18.0-cp310-cp310-linux_aarch64.whl

pip3 install torch-2.3.0-cp310-cp310-linux_aarch64.whl
pip3 install torchvision-0.18.0a0+6043bc2-cp310-cp310-linux_aarch64.whl
pip3 install onnxruntime_gpu-1.18.0-cp310-cp310-linux_aarch64.whl

pip3 install numpy==1.23.5