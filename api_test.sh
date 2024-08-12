#!/bin/bash

# Put Image
IMAGE_PATH="Put your image file path"

URL="http://localhost:5000/"

echo -e "Target Image: ${IMAGE_PATH}"

curl -X POST $URL \
  -F "file=@$IMAGE_PATH" \
  -H "Content-Type: multipart/form-data"

echo -e "\n"