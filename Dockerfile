# Use Ubuntu as base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends unzip apt-utils libcurl4-openssl-dev

# Expose minecraft bedrock port
EXPOSE 19132/tcp
EXPOSE 19132/udp

# Set workdir
WORKDIR /bedrock-server

# Download bedrock server from azure cloud
ADD https://minecraft.azureedge.net/bin-linux/bedrock-server-1.12.0.28.zip /bedrock-server

# Unzip to workdir
RUN unzip bedrock-server-1.12.0.28.zip

# Set env path
ENV LD_LIBRARY_PATH=.

# Start server
CMD ./bedrock_server
