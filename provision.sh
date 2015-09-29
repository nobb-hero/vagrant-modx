sudo apt-get update
sudo apt-get install -y unzip

# modx
echo "Getting MODx..."
rm -rf evo*
wget -q -O modx.zip http://modx.jp/files/evo/modx-1.0.14J-r9.zip

# unzip and put to place
unzip -q modx.zip
cd evo*
cp -r * /var/www/public
cd ~

# set php timezone
echo "Configuring PHP Timezone..."
rm -rf tzupdate*
wget -q -O tzupdate.zip https://github.com/victorhaggqvist/tzupdate/archive/master.zip
unzip -q tzupdate.zip
echo "date.timezone=\"$(./tzupdate-master/tzupdate -p)\"" | sudo tee -a /etc/php5/apache2/php.ini

sudo service apache2 restart
