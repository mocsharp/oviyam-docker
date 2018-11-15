FROM tomcat:7.0.91-jre7

RUN apt-get install curl unzip

WORKDIR  /

RUN mkdir ovitmp && \
    cd ovitmp && \
    curl https://iweb.dl.sourceforge.net/project/dcm4che/Oviyam/2.7/Oviyam-2.7-bin.zip > oviyam.zip && \
        unzip oviyam.zip

RUN cp /ovitmp/Oviyam-2.7-bin/Oviyam-2.7-bin/oviyam2.war /usr/local/tomcat/webapps/oviyam.war
RUN cp /ovitmp/Oviyam-2.7-bin/tomcat/*.jar  /usr/local/tomcat/lib
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml