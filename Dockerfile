# Use Ubuntu as base image
FROM ubuntu:18.04

# Set timezone:
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

# Install dependencies:
RUN apt-get update && apt-get install -y tzdata

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends wget unzip php apt-utils libcurl4-openssl-dev ca-certificates curl

# Expose minecraft bedrock port IPv4
EXPOSE 19132/tcp
EXPOSE 19132/udp
# Expose minecraft bedrock port IPv6
EXPOSE 19133/tcp
EXPOSE 19133/udp

# Set workdir
WORKDIR /bedrock-server

# Download bedrock server zip
COPY ./getbedrockserver.sh /
COPY ./latestbedrock.php /
RUN chmod +x /getbedrockserver.sh
RUN chmod +x /latestbedrock.php
RUN /getbedrockserver.sh 

# Unzip to workdir
RUN unzip bedrock-server-ubuntu.zip

# Set env path
ENV LD_LIBRARY_PATH=.

# set permission
RUN chmod +x bedrock_server

# Start server
CMD ./bedrock_server
