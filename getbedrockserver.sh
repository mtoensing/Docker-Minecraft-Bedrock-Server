# Get url to latest server binary by parsing the download webpage with an xpath using xidel
URL=$(xidel https://www.minecraft.net/en-us/download/server/bedrock -e "//a[@aria-label='Download Minecraft Dedicated Server software for Ubuntu (Linux)']/@href")
echo -----------------
echo $URL
echo -----------------
# Download the server binary with curl 
curl -H "Accept-Encoding: identity" -H "Accept-Language: en" -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4.212 Safari/537.36" -o bedrock-server-ubuntu.zip $URL
