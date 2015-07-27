#!/bin/sh

if [ $VIRTUOSO_PASSWORD ]; then
    /bin/sed -i "s|store.virtuoso.password    = \"dba\"|store.virtuoso.password    = \"$VIRTUOSO_PASSWORD\"|" /var/www/config.ini
fi

# start the php5-fpm service
echo "starting php …"
service php5-fpm start

# start the nginx service
echo "starting nginx …"
service nginx start

echo "OntoWiki is ready to set sail!"
cat /ow-docker.fig
echo ""
echo "following log:"

OWLOG="/var/www/logs/ontowiki.log"
touch $OWLOG
chmod a+w $OWLOG
tail -f $OWLOG
