# Minecraft-Bedrock-Server-docker

Tutorial (german) https://marc.tv/anleitung-minecraft-bedrock-server-auf-einem-synology-nas/

## Volumes 

Local folder: /my_local_path/
Mount path: /bedrock-server/worlds

### Optional:
[Example properties file](https://github.com/mtoensing/Docker-Minecraft-Bedrock-Server/blob/master/server.properties)

Local file: /my_local_path/server.properties
Mount path: /bedrock-server/server.properties

## Port Settings

Local Port: 19132 TCP
Container Port: 19132 TCP

Local Port: 19132 UDP
Container Port: 19132 UDP
