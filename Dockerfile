FROM centos:7.9.2009
MAINTAINER sunilmbhoi@gmail.com
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD apache-tomcat-8.5.77.tar.gz /tmp/
RUN mv /tmp/apache-tomcat-8.5.77/* /opt/tomcat/.
COPY server.xml /opt/tomcat/conf/server.xml
RUN yum -y install java-11-openjdk
RUN java -version
# app base test
RUN mkdir /opt/tomcat/dev
WORKDIR /opt/tomcat/dev
RUN  rm -rf /opt/tomcat/webapps/*
COPY SampleWebApp.war /opt/tomcat/dev/

EXPOSE 8080 
CMD ["/opt/tomcat/bin/catalina.sh","run"]
