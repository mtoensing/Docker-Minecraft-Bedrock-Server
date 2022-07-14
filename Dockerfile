# Use Ubuntu as base image
FROM ubuntu:18.04

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends wget unzip apt-utils libcurl4-openssl-dev ca-certificates curl xidel

# Install time zone package
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata

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
RUN chmod +x /getbedrockserver.sh
RUN /getbedrockserver.sh 

# Unzip to workdir
RUN unzip bedrock-server-ubuntu.zip

# Set env path
ENV LD_LIBRARY_PATH=.

# set permission
RUN chmod +x bedrock_server

# Start server
CMD ./bedrock_server
