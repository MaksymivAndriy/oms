FROM maven:3.5.0-jdk-8-alpine AS builder

ADD ./pom.xml pom.xml
ADD ./src src/
RUN mvn clean package


FROM tomcat:jre8-temurin-focal

COPY --from=builder target/OMS.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
