#!/bin/bash

# Put Image
IMAGE_PATH="Put your image file path"

URL="http://localhost:5000/"

echo -e "Target Image: ${IMAGE_PATH}"

curl -X POST $URL \
  -F "file=@$IMAGE_PATH" \
  -H "Content-Type: multipart/form-data"

echo -e "\n"

# Example
# [
#     {
#         "class": "person",
#         "confidence": 0.91,
#         "bbox": [
#             919,
#             113,
#             1253,
#             990
#         ]
#     },
#     {
#         "class": "person",
#         "confidence": 0.87,
#         "bbox": [
#             1215,
#             254,
#             1448,
#             738
#         ]
#     }
# ]