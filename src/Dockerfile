FROM ultralytics/ultralytics:latest-jetson-jetpack6

RUN pip3 install flask
RUN mkdir -p /ultralytics/src /ultralytics/models

WORKDIR /ultralytics/src

COPY . /ultralytics/src
COPY ../models /ultralytics/models

ENV FLASK_APP=app.py

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]