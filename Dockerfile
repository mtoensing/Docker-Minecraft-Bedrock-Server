# Use Ubuntu as base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends unzip apt-utils libcurl4-openssl-dev ca-certificates curl

# Expose minecraft bedrock port
EXPOSE 19132/tcp
EXPOSE 19132/udp

# Set workdir
WORKDIR /bedrock-server

# Download latest bedrock server
# WARNING: Don't copy that! This will not work forever!
ADD http://mc.marc.tv/latestbedrock/ bedrock-server.zip

# Unzip to workdir
RUN unzip bedrock-server.zip

# Set env path
ENV LD_LIBRARY_PATH=.

# Start server
CMD ./bedrock_server
