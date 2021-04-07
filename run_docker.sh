docker run \
  --rm \
  --name mcbedrock \
  -e MEMORYSIZE='1G' \
  -p 19132:19132 \
-i marctv/minecraftbedrockserver
docker attach mcbedrock 
