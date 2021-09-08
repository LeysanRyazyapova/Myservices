FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vsftpd openssl supervisor

RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/selfsigned.key -x509 -days 365 -out /etc/ssl/certs/selfsigned.crt -subj "/C=US/ST=Utah/L=Lehi/O=Your Company, Inc./OU=IT/CN=yourdomain.com"

RUN addgroup -S ftps && adduser -S admin -G ftps -h /var/www
RUN echo "admin:admin" | chpasswd
RUN chown admin:ftps /var/www

COPY ./supervisord.conf /etc/supervisord.conf
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./start.sh /start.sh

RUN chmod -R 777 /etc/vsftpd/vsftpd.conf
RUN chmod -R 755 /start.sh

EXPOSE 21 21000

CMD ["/start.sh"]