FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y unzip apt-utils

WORKDIR /bedrock-server
ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-1.12.0.28.zip /tmp
RUN cd /tmp
RUN unzip bedrock-server-1.12.0.28.zip
RUN mv -v /tmp/* /bedrock-server
RUN cd /bedrock-server
ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
