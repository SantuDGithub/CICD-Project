FROM tomcat:latest
RUN rm -rf /usr/local/tomcat/webapps.dist/*
COPY ./target/*.war /usr/local/tomcat/webapps.dist/ROOT.war
EXPOSE 8888
CMD ["catalina.sh","run"]
