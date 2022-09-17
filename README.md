# Minecraft Bedrock Server Docker Image 1.19+

* YouTube Video Tutorial https://youtu.be/jbyuWkF0RNQ
* Tutorial (german) https://marc.tv/anleitung-minecraft-bedrock-server-auf-einem-synology-nas/ 
* GitHub https://github.com/mtoensing/Docker-Minecraft-Bedrock-Server 
* Support https://github.com/mtoensing/Docker-Minecraft-Bedrock-Server/issues
* Always up-to-date.

# How do I update the container? 

* Re-download the image from the docker
* Stop the container
* Clear the container
* Start the container

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

### Optional: edit server.properties and allowlist.json

To edit the server.properties and allowlist.json you have to add them locally on your NAS
and mount these files in the container.

![Correct local and container paths](https://marc.tv/media/2019/04/bedrock-server-properties.jpg "Correct local and container paths")

Download these files and place them in the parent folder of your bedrock docker folder. e.g.

* [Example server.properties file](https://raw.githubusercontent.com/mtoensing/Docker-Minecraft-Bedrock-Server/master/server.properties)
* [Example empty allowlist.json file](https://raw.githubusercontent.com/mtoensing/Docker-Minecraft-Bedrock-Server/master/allowlist.json)

**Worlds**
* **Local folder:** /volume1/docker/bedrockserver/worlds
* **Mount path:** /bedrock-server/worlds

**server.properties**
* **Local file server.properties:** /volume1/docker/bedrockserver/server.properties
* **Mount path:** /bedrock-server/server.properties

**allowlist.json**
* **Local file allowlist.json:** /volume1/docker/bedrockserver/allowlist.json
* **Mount path:** /bedrock-server/allowlist.json

You can edit the server.properties on you NAS directly after you shut down the server. You can edit specific options like gamemode (creative or survival) or enable the allowlist. The later is highly recommended if you plan to open the ports to the internet.

## Add someone to the allowlist and grant user admin rights

You can enter commands in terminal on Synology on your Docker Container. Add users to the allowlist and do not edit the allowlist.json manually:

**allowlist add [xbox playername]**

e.g. `allowlist add MarcTV`

**op [xbox playername]**

e.g. `op MarcTV`

This only works if the user is online.

![Terminal in Bedrock](https://marc.tv/media/2020/01/bedrock-terminal.jpg "Terminal in Bedrock")

