FROM httpd:2.4
COPY ./src/html/index.html /usr/local/apache2/htdocs/
