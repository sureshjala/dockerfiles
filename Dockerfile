FROM ubuntu
RUN apt update && \
apt install openjdk-11-jdk -y && \
wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar
EXPOSE 8080
CMD ["java","-jar","spring-petclinic-2.4.2.jar"] 

