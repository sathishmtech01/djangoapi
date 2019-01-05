FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /djangoapi
WORKDIR /djangoapi
ADD requirements.txt /djangoapi/
RUN pip install -r requirements.txt
ADD . /djangoapi/