FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y unzip apt-utils

WORKDIR /bedrock-server
RUN mkdir /tmp
ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-1.12.0.28.zip /bedrock-server
RUN unzip bedrock-server-1.12.0.28.zip /tmp
RUN mv -v /tmp/bedrock-server-1.12.0.28/* /bedrock-server

ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
