# Minecraft-Bedrock-Server-docker 1.14.0.9

Tutorial (german) https://marc.tv/anleitung-minecraft-bedrock-server-auf-einem-synology-nas/

## Volumes

Local folder: /volume1/docker/bedrockserver/worlds

Mount path: /bedrock-server/worlds

### Optional: edit server.properties and whitelist.json

To edit the server.properties and whitelist.json you have to add them locally on your NAS
and mount these files in the container.

![Correct local and container paths](https://marc.tv/media/2019/04/bedrock-server-properties.jpg "Correct local and container paths")

Download these files and place them in the parent folder of your bedrock docker folder. e.g.

* [Example server.properties file](https://raw.githubusercontent.com/mtoensing/Docker-Minecraft-Bedrock-Server/master/server.properties)
* [Example empty whitelist.json file](https://raw.githubusercontent.com/mtoensing/Docker-Minecraft-Bedrock-Server/master/whitelist.json)

*Local folder:* /volume1/docker/bedrockserver/worlds
*Mount path:* /bedrock-server/worlds

*Local file server.properties:* /volume1/docker/bedrockserver/server.properties
*Mount path:* /bedrock-server/server.properties

*Local file whitelist.json:* /volume1/docker/bedrockserver/whitelist.json
*Mount path:* /bedrock-server/whitelist.json

## Add someone to the whitelist and grant user admin rights

You can enter commands in terminal on Synology on your Docker Container. Add users to the whitelist and do not edit the whitelist.json manually:

*whitelist add [xbox playername]*
e.g. `whitelist add MarcTV`

*op [xbox playername]*
e.g. `op MarcTV`

This only works if the user is online.

![Terminal in Bedrock](https://marc.tv/media/2020/01/bedrock-terminal.jpg "Terminal in Bedrock")

## Port Settings

Local Port: 19132 TCP

Container Port: 19132 TCP


Local Port: 19132 UDP

Container Port: 19132 UDP

## How to install the BEDROCK Server on a Synology NAS

[![Watch the video](https://img.youtube.com/vi/jbyuWkF0RNQ/maxresdefault.jpg)](https://youtu.be/jbyuWkF0RNQ)
