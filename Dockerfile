# Use Ubuntu 24.04 LTS as base image
FROM docker.io/library/ubuntu:24.04

ARG DOWNLOAD_URL

# Install necessary packages
RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y --no-install-recommends unzip ca-certificates curl tzdata

# Set workdir
WORKDIR /bedrock-server

RUN echo "Downloading from ${DOWNLOAD_URL}"

# download bedrock server
RUN curl -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4.212 Safari/537.36" \
    -o "bedrock-server-ubuntu.zip" "${DOWNLOAD_URL}"

# Unzip to workdir
RUN unzip bedrock-server-ubuntu.zip && \
    rm bedrock-server-ubuntu.zip && \
    chmod +x bedrock_server

# Set env path
ENV LD_LIBRARY_PATH=.

CMD ./bedrock_server

# Expose minecraft bedrock port IPv4
EXPOSE 19132/tcp 19132/udp

# Expose minecraft bedrock port IPv6
EXPOSE 19133/tcp 19133/udp

VOLUME /bedrock-server/worlds

SHELL ["/bin/bash"]
