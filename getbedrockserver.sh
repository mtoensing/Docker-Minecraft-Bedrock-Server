# source of this script is latestbedrock.php in this repo. 
content=$(wget https://mc.marc.tv/latestbedrock/?pass=Hdha1ujNsvTwFl -q -O -)
echo -----------------
echo $content
echo -----------------
curl -H "Accept-Encoding: identity" -H "Accept-Language: en" -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4.212 Safari/537.36" -o bedrock-server-ubuntu.zip $content