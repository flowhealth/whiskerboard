FROM ubuntu:trusty

MAINTAINER Viktor Miroshnikov <me@vmiroshnikov.com>
# Basic prereq
RUN apt-get -q -y update
RUN apt-get -q -y install git python-pip
RUN mkdir -p /opt
WORKDIR /opt
RUN git clone github.com/flowhealth/whiskerboard
WORKDIR /opt/whiskerboard
RUN pip install -r requirements.txt
EXPOSE 8000
CMD ./manage.py syncdb && ./manage.py migrate && ./manage.py runserver
