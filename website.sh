#!/bin/bash
echo "welcome to the website creation portal"
echo "Installing httpd server and wget"
sudo yum install wget httpd -y
echo "fecthing the website packages using wget"
sudo wget https://github.com/ceeepath/project-templates/archive/refs/tags/website_1.0.0.tar.gz
echo "extracting the website file and compressing into a zip file"
tar -xvf website_1.0.0.tar.gz
ehco "changing directory into the extracted file"
cd project-templates-website_1.0.0
echo "now extracting and compresseing the already compressed file"
tar -xvf project-templates-website_1.0.0
tar -xvf template01.tar.gz
echo "changing directory into the compressed file"
cd template01
echo "renaming file index to index.html"
sudo mv index index.html
echo "copying website files from a development dir to web servers"
sudo cp -r * /var/www/html
echo "changing permissons"
sudo chmod -R 755 /var/www/html
echo "enabling serve"
sudo systemctl enable httpd
echo "starting server"
sudo systemctl start httpd
