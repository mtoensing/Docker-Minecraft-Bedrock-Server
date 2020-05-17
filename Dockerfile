# Use Ubuntu as base image
FROM ubuntu:18.04

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends wget unzip apt-utils libcurl4-openssl-dev ca-certificates curl

# Expose minecraft bedrock port IPv4
EXPOSE 19132/tcp
EXPOSE 19132/udp
# Expose minecraft bedrock port IPv6
EXPOSE 19133/tcp
EXPOSE 19133/udp

# Set workdir
WORKDIR /bedrock-server

# Download latest bedrock server
# WARNING: Don't copy that! This will not work forever!
RUN wget -q --content-disposition 'https://mc.marc.tv/latestbedrock/?pass=123'

# Unzip to workdir
RUN unzip *.zip

# Set env path
ENV LD_LIBRARY_PATH=.

# Start server
CMD ./bedrock_server
