FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

WORKDIR /bedrock-server
ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-1.12.0.28.zip /bedrock-server
RUN ls -la
RUN cd /bedrock-server/bedrock-server-1.12.0.28/
ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
