FROM httpd:2.4-alpine

EXPOSE 80
COPY apache/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./html/ /var/www/html/
