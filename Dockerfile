# Pull base image 
From tomcat:8-jre8

# Maintainer 
WORKDIR /var/lib/jenkins/workspace/demo
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps

