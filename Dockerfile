FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y unzip

WORKDIR /bedrock-server
ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-1.12.0.28.zip /bedrock-server
RUN unzip bedrock-server-1.12.0.28.zip

ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
