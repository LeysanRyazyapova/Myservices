FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add wget libc-dev  libc6-compat
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community --no-cache --allow-untrusted
RUN wget https://dl.grafana.com/oss/release/grafana-8.0.2.linux-amd64.tar.gz
RUN tar -zxvf grafana-8.0.2.linux-amd64.tar.gz && rm -rf grafana-8.0.2.linux-amd64.tar.gz
RUN mv grafana-8.0.2 grafana
RUN mkdir /etc/telegraf/
COPY ./telegraf.conf /etc/telegraf/
COPY start.sh .
RUN chmod +x ./start.sh
EXPOSE 3000
CMD sh start.sh