FROM centos:7
MAINTAINER Marco Palladino, marco@mashape.com

ENV KONG_VERSION 0.5.2

RUN yum install -y wget
RUN wget -O kong-0.5.2hotfixuri.el7.noarch.rpm https://www.dropbox.com/s/46t5g0dv70ikjhb/kong-0.5.2hotfixuri.el7.noarch.rpm?dl=1

RUN yum install -y kong-0.5.2hotfixuri.el7.noarch.rpm && \
    yum clean all 

VOLUME ["/etc/kong/"]

COPY config.docker/kong.yml /etc/kong/kong.yml

CMD kong start

EXPOSE 8000 8001
