# Bước 1: Dùng Maven để build WAR
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app

# copy toàn bộ code vào container
COPY . .

# build ra file .war
RUN mvn clean package -DskipTests

# Bước 2: Dùng Tomcat để chạy WAR
FROM tomcat:9.0-jdk17

# Xóa app mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR từ stage build sang Tomcat
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

CMD ["catalina.sh", "run"]
