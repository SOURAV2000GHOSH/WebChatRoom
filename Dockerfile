FROM adoptopenjdk/maven-openjdk8 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:8-jdk-slim
COPY --from=build /target/webchat-0.0.1-SNAPSHOT.jar webchatroom.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","webchatroom.jar" ]
