FROM tomcat:9.0

COPY *.war / usr/local/tomcat/webapps/ROOT.war
