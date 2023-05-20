FROM ubuntu:latest
MAINTAINER brijeshsahu0395@gmail.com

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y apache2 zip unzip curl

RUN curl -o photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip \
    && unzip photogenic.zip \
    && rm photogenic.zip

WORKDIR /var/www/html/
RUN cp -rvf photogenic-*/. .
RUN rm -rf photogenic-*/

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
