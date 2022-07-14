<?php
/* Helper script for marctv bedrock docker */  

if($_GET["pass"] != "mypassword") die();

/* Use internal libxml errors -- turn on in production, off for debugging */
libxml_use_internal_errors(true);

$url = "https://www.minecraft.net/en-us/download/server/bedrock";
$useragent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (K HTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36";
$ch = curl_init();

// set user agent
curl_setopt($ch, CURLOPT_USERAGENT, $useragent);
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 2);
curl_setopt($ch, CURLOPT_TIMEOUT, 60);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

// grab content from the website
$content = curl_exec($ch);
curl_close($ch);    

// load the content in your dom
$dom = new DOMDocument();
$dom->loadHTML($content);

/* Create a new XPath object */
$xpath = new DomXPath($dom);
$nodes = $xpath->query("//a[@aria-label='Download Minecraft Dedicated Server software for Ubuntu (Linux)']");
foreach ($nodes as $i => $node) {
   $url = $node->getAttribute("href");
}

if (filter_var($url, FILTER_VALIDATE_URL) === FALSE) {
   die();
}

echo $url;  
die();

?>
