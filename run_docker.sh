docker run \
  --platform linux/amd64 \
  --rm \
  --kernel-memory 1G \
  --env TZ=Europe/Berlin \
  -v /etc/localtime:/etc/localtime:ro \
  -p 19132:19132/tcp \
  -p 19132:19132/udp \
  --name mcbedrock \
  -i docker.io/marctv/mcbedrock:dev

docker attach mcbedrock
