# Use OpenJDK 17 as base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy Maven files and build project
COPY . .

# Package the application
RUN ./mvnw clean package -DskipTests || mvn clean package -DskipTests

# Expose the port Spring Boot runs on
EXPOSE 8080

# Run the JAR
CMD ["java", "-jar", "target/portfolio-0.0.1-SNAPSHOT.jar"]
