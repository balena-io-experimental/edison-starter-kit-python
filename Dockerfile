#Use the edison-python base image from
#https://registry.hub.docker.com/u/resin/edison-python/
FROM resin/edison-python:latest
MAINTAINER Shaun Mulligan <shaun@resin.io>

#switch on systemd init system in container
ENV INITSYSTEM on

# install UPM
# Update commit if need to recompile library
ENV UPMCOMMIT 03e72e02f811cb9a47000a6f12fca61a2908d325
RUN curl -sSL https://github.com/intel-iot-devkit/upm/archive/$UPMCOMMIT.tar.gz \
		| tar -v -C /usr/src -xz && \
    cd /usr/src/upm-$UPMCOMMIT && \
    mkdir build && \
    cd build && \
    cmake .. -DBUILDSWIGNODE=OFF && \
    make && \
    make install

# pip install python deps from requirements.txt
# For caching until requirements.txt changes
ADD ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Main code
ADD /app /usr/src/app

WORKDIR /usr/src/app

#Copy all the initialisation scripts
COPY ./*.sh /

CMD ["/docker-entrypoint.sh"]
