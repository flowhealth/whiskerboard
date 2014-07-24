FROM ubuntu:trusty

MAINTAINER Viktor Miroshnikov <me@vmiroshnikov.com>
# Basic prereq
RUN apt-get -q -y update
RUN apt-get -q -y install git python-pip
RUN mkdir /root/.ssh && touch /root/.ssh/known_hosts && ssh-keyscan -H "github.com" >> /root/.ssh/known_hosts && chmod 600 /root/.ssh/known_hosts
RUN mkdir -p /opt
WORKDIR /opt
RUN git clone git@github.com:flowhealth/whiskerboard.git
WORKDIR /opt/whiskerboard
RUN pip install -r requirements.txt
EXPOSE 8000
CMD ./manage.py syncdb && ./manage.py migrate && ./manage.py runserver
