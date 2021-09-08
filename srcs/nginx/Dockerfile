FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl supervisor

COPY ./default.conf /etc/nginx/conf.d/default.conf

COPY ./setup.sh .
COPY ./supervisord.conf /etc/supervisord.conf
RUN mkdir /var/www/html
RUN touch /var/www/html/index.html
RUN echo Hello World! > /var/www/html/index.html
RUN chmod +x ./setup.sh && mkdir -p /run/nginx
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Russia/L=Kazan/O=vault/OU=42kazan/CN=tmiranda" \
-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;
CMD ["./setup.sh"]