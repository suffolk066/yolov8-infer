# YOLOv8 Inference API with Docker
## Requirements
* Jetson Orin Device(AGX Orin, Orin NX, Orin Nano) with Jetpack 6
# HOW TO RUN
## Local
* Install Requirements
    > ```
    > git clone https://github.com/suffolk066/yolov8-infer
    > cd yolov8-infer
    > bash local_install.sh
    > ```
* Get Model - For example, to download YOLOv8-S:
    > ```
    > cd models
    > yolo export model=yolov8s.pt format=engine half=True
    > ```
* Place the model file into the ./models folder.
* Set your MODEL_PATH in the src/app.py file:
    > ```
    > MODEL_PATH = 'Put your model path'
    > ```
* Run local server
    > ```
    > python3 src/app.py
    > ```
## DOCKER
* Create Docker Image
    > ```
    > git clone https://github.com/suffolk066/yolov8-infer
    > cd yolov8-infer
    > docker build -f src/Dockerfile -t yolov8-infer .
    > ```
* Run docker container
    > ```
    > docker run -it -d \
    > -v $(pwd)/runs:/ultralytics/runs \
    > -v $(pwd)/models:/ultralytics/models \
    > -v $(pwd)/src:/ultralytics/src \
    > --ipc=host --runtime=nvidia -p 5000:5000 \
    > -name yolov8-infer yolov8-infer
    > ```
* Get Model - For example, to download YOLOv8-S:
    > ```
    > cd .. && cd models
    > yolo export model=yolov8s.pt format=engine half=True
    > ```
* Set your MODEL_PATH in the src/app.py file:
    > ```
    > MODEL_PATH = '../models/yolov8s.engine' # For example, to download YOLOv8-S:
    > ```
## How to Test
* Find an image of your choice.
* Update the IMAGE_PATH in the ./api_test.sh script.
* Run the test script:
    > ```
    > bash api_test.sh
    > ```