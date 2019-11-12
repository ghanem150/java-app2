FROM maven:3.5.2-jdk-8-alpine AS MAVEN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package
 
FROM tomcat:latest
COPY --from=MAVEN /tmp/target/java-app1-1.0.war $CATALINA_HOME/webapps/java-app1-1.0.war
HEALTHCHECK --interval=1m --timeout=3s CMD wget --quiet --tries=1 --spider http://192.168.1.50:2222/wizard/ || exit 1
