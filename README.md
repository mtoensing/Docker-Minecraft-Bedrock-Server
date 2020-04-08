# Minecraft Bedrock Server Docker Image 

* YouTube Video Tutorial (english) https://youtu.be/jbyuWkF0RNQ
* Tutorial (german) https://marc.tv/anleitung-minecraft-bedrock-server-auf-einem-synology-nas/ 
* Get Image on DockerHub https://hub.docker.com/r/marctv/minecraft-bedrock-server
* V1.14.32.1

## Video: How to install the BEDROCK Server on a Synology NAS

[![Watch the video](https://img.youtube.com/vi/jbyuWkF0RNQ/maxresdefault.jpg)](https://youtu.be/jbyuWkF0RNQ)
https://youtu.be/jbyuWkF0RNQ

## Volumes

**Worlds**
* **Local folder:** /volume1/docker/bedrockserver/worlds
* **Mount path:** /bedrock-server/worlds

## Port Settings

**TCP**
* **Local Port:** 19132 TCP
* **Container Port:** 19132 TCP

**UDP**
* **Local Port:** 19132 UDP
* **Container Port:** 19132 UDP

Open these ports of the local ip of your NAS to the internet in your router. Consult the manual of your router for this.

![Correct local and container ports](https://marc.tv/media/2020/01/bedrock-port.jpg "Correct local and container ports")

### Optional: edit server.properties and whitelist.json

To edit the server.properties and whitelist.json you have to add them locally on your NAS
and mount these files in the container.

![Correct local and container paths](https://marc.tv/media/2019/04/bedrock-server-properties.jpg "Correct local and container paths")

Download these files and place them in the parent folder of your bedrock docker folder. e.g.

* [Example server.properties file](https://raw.githubusercontent.com/mtoensing/Docker-Minecraft-Bedrock-Server/master/server.properties)
* [Example empty whitelist.json file](https://raw.githubusercontent.com/mtoensing/Docker-Minecraft-Bedrock-Server/master/whitelist.json)

**Worlds**
* **Local folder:** /volume1/docker/bedrockserver/worlds
* **Mount path:** /bedrock-server/worlds

**server.properties**
* **Local file server.properties:** /volume1/docker/bedrockserver/server.properties
* **Mount path:** /bedrock-server/server.properties

**whitelist.json**
* **Local file whitelist.json:** /volume1/docker/bedrockserver/whitelist.json
* **Mount path:** /bedrock-server/whitelist.json

You can edit the server.properties on you NAS directly after you shut down the server. You can edit specific options like gamemode (creative or survival) or enable the whitelist. The later is highly recommended if you plan to open the ports to the internet.

## Add someone to the whitelist and grant user admin rights

You can enter commands in terminal on Synology on your Docker Container. Add users to the whitelist and do not edit the whitelist.json manually:

**whitelist add [xbox playername]**

e.g. `whitelist add MarcTV`

**op [xbox playername]**

e.g. `op MarcTV`

This only works if the user is online.

![Terminal in Bedrock](https://marc.tv/media/2020/01/bedrock-terminal.jpg "Terminal in Bedrock")

