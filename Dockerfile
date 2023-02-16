FROM tomcat
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8082
CMD ["catalina.sh","run"]
