# Container with Globus Server installed in a Centos 7 system

# Parent Centos 7 with EPEL repositories container 
FROM jiahuikchen/centos-7-epel

# Adding Globus Connect Server to packages
RUN curl -LOs https://downloads.globus.org/toolkit/globus-connect-server/globus-connect-server-repo-latest.noarch.rpm 
RUN rpm --import https://downloads.globus.org/toolkit/gt6/stable/repo/rpm/RPM-GPG-KEY-Globus
RUN yum -y install globus-connect-server-repo-latest.noarch.rpm

# Installing cron, needed for CILogon authentication
RUN yum -y install cronie

# Installing Globus Connect Server
RUN yum -y install globus-connect-server

# /etc is the directory for globus's executables
WORKDIR /etc
# Adding server config file to container
ADD globus-connect-server.conf globus-connect-server.conf
# Adding script that creates endpoint to container
ADD start.sh start.sh
#RUN chmod a+x start.sh

#Exposing ports Globus's GridFTP Server uses
EXPOSE 2811
EXPOSE 50000-51000 

#Exposing ports Globus's MyProxy Server uses
EXPOSE 7512

#Exposing ports Globus's OAuth Server uses
EXPOSE 443

# Making an endpoint by running the globus-connect-server-setup script
ENTRYPOINT ["./start.sh"]
