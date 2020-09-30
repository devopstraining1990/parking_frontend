FROM tomcat:8.0-alpine
LABEL maintainer "suresh"
WORKDIR /opt
RUN apt update -y
RUN apt upgrade -y
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY build /usr/local/tomcat/webapps/build
VOLUME tomcat:/usr/local/tomcat/webapps
EXPOSE 8888
