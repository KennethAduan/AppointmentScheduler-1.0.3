FROM maven:3.8.4-openjdk-8 as build

COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:8-jre-slim-buster
COPY --from=build /target/appointmentscheduler-0.0.1-SNAPSHOT.jar appointmentscheduler.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","appointmentscheduler.jar"]