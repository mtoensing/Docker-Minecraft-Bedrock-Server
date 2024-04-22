#!/usr/bin/env bash

MC_DOWNLOAD_PAGE="https://www.minecraft.net/en-us/download/server/bedrock"
CURL_USER_AGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Safari/605.1.15"

curl -s -L -A "${CURL_USER_AGENT}" -o download.html "${MC_DOWNLOAD_PAGE}"

cat download.html | grep "linux/bedrock-server-" | egrep -o 'https?://[^" ]+'

cat download.html | grep "linux/bedrock-server-" | egrep -o 'https?://[^" ]+' | xargs basename -s ".zip" | sed -En 's#bedrock-server-([0-9.]+)#\1#p'
