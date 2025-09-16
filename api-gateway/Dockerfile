# Once a layer is rebuilt, all subsequent layers are rebuilt from scratch, regardless of whether their specific files have changed.
FROM eclipse-temurin:21-jdk-alpine AS build
# we will create a layer that contains the base directory
WORKDIR /app
# create leyrs that have necessary maven scripts
COPY mvnw .
COPY .mvn .mvn
# creates a new layer that has the dependency file pom.xml
COPY pom.xml .
# only creates a layer if the previous layer has changed (pom.xml)
# the layer contains installed dependencies
RUN chmod +x ./mvnw
RUN ./mvnw dependency:resolve
# new layer with source code (changes frequently)
COPY src ./src
RUN ./mvnw package -DskipTests

FROM eclipse-temurin:21-jre-alpine AS runtime
WORKDIR /app
# Copy only the JAR file
COPY --from=build /app/target/*.jar app.jar



EXPOSE 8888

CMD ["java", "-jar", "app.jar"]