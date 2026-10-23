#!/bin/bash
# Bedrock has no SIGTERM handler and only shuts down cleanly on the "stop" command.
# Translate SIGTERM/SIGINT into "stop" and keep forwarding the container's stdin.
fifo=$(mktemp -u)
mkfifo "$fifo"
exec 3<>"$fifo"
rm -f "$fifo"

./bedrock_server <&3 &
server=$!

cat <&0 >&3 &

trap 'echo stop >&3' TERM INT

wait "$server"
status=$?
if [ "$status" -gt 128 ]; then
  wait "$server"
  status=$?
fi
exit "$status"
