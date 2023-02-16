# Base image
FROM tomcat:latest

# Install nano text editor
RUN apt-get update && apt-get install -y nano

# Copy configuration files to container
COPY ./config-files/context.xml /usr/local/tomcat/webapps/host-manager/META-INF/
COPY ./config-files/context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY ./config-files/tomcat-users.xml /usr/local/tomcat/conf/

# Set permissions for configuration files
RUN chmod 644 /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
RUN chmod 644 /usr/local/tomcat/webapps/manager/META-INF/context.xml
RUN chmod 644 /usr/local/tomcat/conf/tomcat-users.xml

# Copy WAR file to container
COPY ./myapp.war /usr/local/tomcat/webapps/

# Expose Tomcat port
EXPOSE 8081

# Start Tomcat
CMD ["catalina.sh", "run"]
