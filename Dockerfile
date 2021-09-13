FROM tomcat:latest

LABEL maintainer="Mohandass M = mohandass.mca11@gmail.com"

ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

EXPOSE 8093

CMD ["catalina.sh", "run"]
