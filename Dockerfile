# Dùng image Tomcat chính thức
FROM tomcat:9.0.108-jdk21

# Xoá các app mặc định của Tomcat (nếu muốn sạch)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR của bạn vào với tên ROOT.war
COPY EmailList.war /usr/local/tomcat/webapps/ROOT.war

# Mặc định Tomcat chạy ở cổng 8080
EXPOSE 8080

CMD ["catalina.sh", "run"]
