# Bước 1: Sử dụng image Tomcat chính thức
FROM tomcat:9.0-jdk17

# Bước 2: Xoá webapps mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Bước 3: Copy file WAR vào Tomcat
# Giả sử file WAR của bạn tên là webmoi.war và nằm cùng thư mục với Dockerfile
COPY EmailList.war /usr/local/tomcat/webapps/ROOT.war

# Bước 4: Expose port 8080
EXPOSE 8080

# Bước 5: Chạy Tomcat
CMD ["catalina.sh", "run"]
