# YOLOv8 Inference API with Docker

## Requirements
* Jetson Orin Device(AGX Orin, Orin NX, Orin Nano) with Jetpack 6
* (Option) `sudo usermod -aG docker $USER` # If you don't run this command, you need to change all `docker` commands to `sudo docker`

## HOW TO RUN

### Local
* Install Requirements
    > ```bash
    > git clone https://github.com/suffolk066/yolov8-infer
    > cd yolov8-infer/
    > bash local_install.sh
    > ```

* Get Model
    > ```bash
    > cd models/
    > yolo export model=yolov8s.pt format=engine half=True
    > ```

* Set your MODEL_PATH in the src/app.py file:
    > ```python
    > MODEL_PATH = '../models/yolov8s.engine' # For example, to download YOLOv8-S:
    > ```

* Run local server
    > ```bash
    > cd .. # run code from yolov8-infer/
    > python3 src/app.py
    > ```

### Docker
* Create Docker Image
    > ```bash
    > git clone https://github.com/suffolk066/yolov8-infer
    > cd yolov8-infer/
    > docker build -f src/Dockerfile -t yolov8-infer .
    > ```

* Run docker container
    > ```bash
    > docker run -it -d \
    > -v $(pwd)/runs:/ultralytics/runs \
    > -v $(pwd)/models:/ultralytics/models \
    > -v $(pwd)/src:/ultralytics/src \
    > --ipc=host --runtime=nvidia -p 5000:5000 \
    > -name yolov8-infer yolov8-infer
    > ```

* Connect docker container
    > ```bash
    > docker exec -it yolov8-infer /bin/bash
    > ```

* Get Model
    > ```bash
    > cd .. && cd models/
    > yolo export model=yolov8s.pt format=engine half=True
    > ```

* Set your MODEL_PATH in the src/app.py file:
    > ```python
    > MODEL_PATH = '../models/yolov8s.engine' # For example, to download YOLOv8-S:
    > ```

### How to Test
* Find an image of your choice.
* Update the IMAGE_PATH in the ./api_test.sh script.
* Run the test script:
    > ```bash
    > bash api_test.sh
    > ```

### Result
![result](https://github.com/user-attachments/assets/4f0cf5d6-8e0a-40e1-9410-44eeece6aa18)
<details>
<summary>Response</summary>
<pre><code class="language-json">
[
    {
        "class": "person",
        "confidence": 0.87,
        "bbox": [
            470,
            305,
            518,
            438
        ]
    },
    {
        "class": "person",
        "confidence": 0.83,
        "bbox": [
            421,
            308,
            480,
            435
        ]
    },
    {
        "class": "person",
        "confidence": 0.82,
        "bbox": [
            726,
            278,
            785,
            408
        ]
    },
    {
        "class": "person",
        "confidence": 0.82,
        "bbox": [
            145,
            256,
            183,
            371
        ]
    },
    {
        "class": "person",
        "confidence": 0.81,
        "bbox": [
            489,
            205,
            527,
            307
        ]
    },
    {
        "class": "person",
        "confidence": 0.8,
        "bbox": [
            90,
            256,
            134,
            367
        ]
    },
    {
        "class": "person",
        "confidence": 0.76,
        "bbox": [
            654,
            218,
            700,
            321
        ]
    },
    {
        "class": "person",
        "confidence": 0.72,
        "bbox": [
            669,
            17,
            695,
            89
        ]
    },
    {
        "class": "person",
        "confidence": 0.71,
        "bbox": [
            794,
            151,
            833,
            260
        ]
    },
    {
        "class": "person",
        "confidence": 0.7,
        "bbox": [
            859,
            277,
            907,
            389
        ]
    },
    {
        "class": "person",
        "confidence": 0.65,
        "bbox": [
            785,
            279,
            836,
            406
        ]
    },
    {
        "class": "person",
        "confidence": 0.63,
        "bbox": [
            201,
            139,
            239,
            230
        ]
    },
    {
        "class": "person",
        "confidence": 0.54,
        "bbox": [
            819,
            169,
            870,
            301
        ]
    }
]
</code></pre>
</details>
