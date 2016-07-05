# Pull base image.
FROM ubuntu:xenial

COPY requirements.txt /tmp/
WORKDIR /tmp

# Install Python.
RUN apt-get -y update && apt-get install -y \
    python3 \
    python3-pip \
    libpq-dev && \
    apt-get clean

# Install Machine Learning dependencies.
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt
RUN rm /tmp/requirements.txt

# Configure TimeZone.
RUN sed -i 's/ZONE=.*/ZONE=Brazil\/East/g' /etc/localtime && \
    ln -sf /usr/share/zoneinfo/Brazil/East /etc/localtime
