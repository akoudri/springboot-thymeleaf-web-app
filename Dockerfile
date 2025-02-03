# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the project's JAR file into the container at /app
COPY target/springboot-thymeleaf-web-app-0.0.1-SNAPSHOT.jar app.jar

# Make port 8181 available to the world outside this container
EXPOSE 8181

# Run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]