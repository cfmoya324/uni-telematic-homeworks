FROM ubuntu:22.04
RUN apt-get update; apt-get install -y apache2 openssl ca-certificates curl libapache2-mod-wsgi-py3 python3-dev python3-pip mysql-client default-libmysqlclient-dev pkg-config build-essential; apt-get clean
RUN pip3 install Flask==2.3.3 flask-cors Flask-MySQLdb Flask-SQLAlchemy
RUN a2enmod ssl rewrite
RUN mkdir /var/www/webapp
COPY webapp /var/www/webapp
COPY apache2/sites-available/000-default.conf /etc/apache2/sites-available/
COPY apache2/apache2.conf /etc/apache2/
EXPOSE 80
EXPOSE 443
CMD ["apache2ctl", "-D", "FOREGROUND"]
