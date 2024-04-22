#!/usr/bin/env bash

MC_DOWNLOAD_PAGE="https://www.minecraft.net/en-us/download/server/bedrock"
CURL_USER_AGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Safari/605.1.15"

#MC_DOWNLOAD_PAGE_CONTENT=$(curl -s -L -A "${CURL_USER_AGENT}" "${MC_DOWNLOAD_PAGE}")
MC_DOWNLOAD_PAGE_CONTENT=$(cat download.html)

echo "${MC_DOWNLOAD_PAGE_CONTENT}" | grep "linux/bedrock-server-" | egrep -o 'https?://[^" ]+'

echo "${MC_DOWNLOAD_PAGE_CONTENT}" | grep "linux/bedrock-server-" | egrep -o 'https?://[^" ]+' | xargs basename -s ".zip" | sed -En 's#bedrock-server-([0-9.]+)#\1#p'

