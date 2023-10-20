# stage 1 : build ..
FROM maven:3.6.3-openjdk-11-slim AS build-stage

WORKDIR /app

COPY pom.xml .

COPY src ./src

RUN mvn clean package

#stage 2 
FROM openjdk:11

COPY --from=build-stage /app/target/ob-item-service-0.0.1-SNAPSHOT.jar ./app.jar

EXPOSE 8081   

ENTRYPOINT ["java", "-jar", "app.jar"]


