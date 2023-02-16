# Base image
FROM tomcat:latest

# Install nano text editor
RUN apt-get update && apt-get install -y nano

# Find and copy context.xml files
RUN find /usr/local/tomcat/webapps/ -name context.xml -exec sed -i 's#</Context>#  <Resource name="jdbc/mydb" auth="Container" type="javax.sql.DataSource" maxTotal="100" maxIdle="30" maxWaitMillis="10000" driverClassName="com.mysql.jdbc.Driver" url="jdbc:mysql://db:3306/mydb?autoReconnect=true" username="root" password="root" />#g' {} \; && \
    find /usr/local/tomcat/webapps/ -name context.xml -exec sed -i 's#</Context>#  <Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="127\\.0\\.0\\.1|::1|0:0:0:0:0:0:0:1" />#g' {} \;

# Set permissions for configuration files
RUN chmod 644 /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
RUN chmod 644 /usr/local/tomcat/webapps/manager/META-INF/context.xml
RUN chmod 644 /usr/local/tomcat/conf/tomcat-users.xml

# Copy WAR file to container
COPY ./target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8081

# Start Tomcat
CMD ["catalina.sh", "run"]
