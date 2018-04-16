FROM python:3.5.5-slim

COPY requirements.txt /tmp/
WORKDIR /tmp

RUN apt-get -y update && apt-get install -y \
    cmake gfortran g++ && \
    apt-get clean

RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt && \
    rm /tmp/requirements.txt

RUN sed -i 's/ZONE=.*/ZONE=Brazil\/East/g' /etc/localtime && \
    ln -sf /usr/share/zoneinfo/Brazil/East /etc/localtime
