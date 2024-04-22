docker run \
  --platform linux/amd64 \
  --rm \
  --name mcbedrock \
  -e MEMORYSIZE='1G' \
  -p 19132:19132 \
  -i docker.io/marctv/minecraftbedrockserver:latest

docker attach mcbedrock
