# Use Ubuntu as base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends unzip apt-utils libcurl4-openssl-dev ca-certificates curl 

# Expose minecraft bedrock port
EXPOSE 19132/tcp
EXPOSE 19132/udp

# Set workdir
WORKDIR /bedrock-server
RUN curl $(curl -L https://minecraft.net/en-us/download/server/bedrock/ 2>/dev/null| grep bin-linux | sed -e 's/.*<a href=\"\(https:.*\/bin-linux\/.*\.zip\).*/\1/') --output bedrock-server.zip

# Unzip to workdir
RUN unzip bedrock-server.zip

# Set env path
ENV LD_LIBRARY_PATH=.

# Start server
CMD ./bedrock_server
