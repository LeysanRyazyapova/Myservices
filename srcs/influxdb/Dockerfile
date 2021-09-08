FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add supervisor wget libc6-compat
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community --no-cache --allow-untrusted
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.4-static_linux_amd64.tar.gz
RUN tar -xf influxdb-1.8.4-static_linux_amd64.tar.gz
RUN mkdir /influxdb
RUN mv influxdb-1.8.4-1 /influxdb/influxdb
RUN sh -c '/influxdb/influxdb/influxd &' && sleep 5 && echo "CREATE DATABASE telegraf" | ./influxdb/influxdb/influx && echo "CREATE USER root WITH PASSWORD 'root'" | /influxdb/influxdb/influx && echo "GRANT ALL ON telegraf TO root" | /influxdb/influxdb/influx
COPY ./supervisord.conf /etc/supervisord.conf
RUN mkdir /etc/telegraf/
COPY ./telegraf.conf /etc/telegraf/
COPY start.sh .
RUN chmod +x /start.sh
EXPOSE	8086
CMD		sh start.sh