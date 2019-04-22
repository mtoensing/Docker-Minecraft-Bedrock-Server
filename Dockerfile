FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y unzip curl libcurl4 libssl1.0.0

WORKDIR /bedrock-server
COPY COPY /bedrock-server

ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
