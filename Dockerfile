FROM maven:3.8.6-openjdk-11 AS stage1
LABEL author="suresh"
RUN git clone https://github.com/openmrs/openmrs-core.git && cd openmrs-core && mvn clean package

FROM tomcat:8.5.82-jdk11-openjdk-slim-bullseye
LABEL author="suresh"
COPY --from=stage1 /openmrs-core/webapp/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
