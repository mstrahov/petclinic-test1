# syntax=docker/dockerfile:1
FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/spring-projects/spring-petclinic.git
# RUN cd spring-petclinic;git status
FROM maven:3.8.4-openjdk-17 as build
WORKDIR /app
COPY --from=clone /app/spring-petclinic /app 
RUN mvn clean install
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar /app/target/*.jar"]
