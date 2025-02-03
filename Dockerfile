# Use an official Maven image to build the project
FROM maven:3.8.5-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and source code into the container
COPY pom.xml .
COPY src ./src

# Compile the project
RUN mvn clean package -DskipTests -Pprod

# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the project's JAR file from the build stage
COPY --from=build /app/target/springboot-thymeleaf-web-app-0.0.1-SNAPSHOT.jar app.jar

# Make port 8181 available to the world outside this container
EXPOSE 8181

# Run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]