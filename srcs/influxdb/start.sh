#!/bin/sh
/usr/bin/supervisord -c /etc/supervisord.conf
# sleep 5
# echo "CREATE DATABASE telegraf" | /influxdb/influxdb/influx
# echo "CREATE USER admin WITH PASSWORD 'passwd' WITH ALL PRIVILEGES" | /influxdb/influxdb/influx
# echo "GRANT ALL ON telegraf TO admin" | /influxdb/influxdb/influx
# /influxdb/influxdb/influxd
# tail -f /dev/null