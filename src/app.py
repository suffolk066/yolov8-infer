import json
import numpy as np
import cv2
from typing import List, Dict, Any
from PIL import Image
from flask import Flask, request, Response
from ultralytics import YOLO

# Constants and configurations
MODEL_PATH = 'Put your model path'
CONF_THRESHOLD = 0.5
IMAGE_SAVE = False

app = Flask(__name__)
model = YOLO(MODEL_PATH, task='detect')

def is_image_file(file: Any) -> bool:
    '''Check if the file is a valid image.'''
    try:
        with Image.open(file) as img:
            img.verify()
        return True
    except (IOError, SyntaxError):
        return False

def load_image(file: Any) -> np.ndarray:
    '''Load image from file object.'''
    file.seek(0)
    npimg = np.frombuffer(file.read(), np.uint8)
    return cv2.imdecode(npimg, cv2.IMREAD_COLOR)

def get_predictions(img: np.ndarray) -> List[Dict[str, Any]]:
    '''Get predictions from the YOLO model.'''
    results = model.predict(img, save=IMAGE_SAVE, conf=CONF_THRESHOLD)
    detection_results = []

    for r in results:
        for box in r.boxes:
            conf = round(float(box.conf), 2)
            det_result = {
                'class': model.names[int(box.cls)],
                'confidence': conf,
                'bbox': [round(x) for x in box.xyxy.tolist()[0]]
            }
            detection_results.append(det_result)

    return detection_results

def create_json_response(data: Any, status_code: int = 200) -> Response:
    '''Create a JSON response using the json module.'''
    response = Response(
        response=json.dumps(data, indent=4),
        status=status_code,
        mimetype='application/json'
    )
    return response

@app.route('/', methods=['POST'])
def upload_file():
    '''Handle file upload and return predictions.'''
    if 'file' not in request.files:
        return create_json_response({"error": "No file part"}, 400)

    file = request.files['file']

    if not is_image_file(file):
        return create_json_response({"error": "Invalid image file"}, 400)

    img = load_image(file)
    detection_results = get_predictions(img)

    return create_json_response(detection_results)

if __name__ == '__main__':
    app.run(debug=False)