# Build stage
# Cargo lo que necesito para compilar
FROM maven:3.6.0-jdk-11-slim AS build 
# Copiamos la carpeta de nuestro proyecto en una carpeta de nuestro contenedor
COPY src /home/app/src 
# Copiamos el pom.xml en una carpeta de nuestro contenedor
COPY pom.xml /home/app 
# Generamos el war en nuestro contenedor
RUN mvn -f /home/app/pom.xml clean package -DskipTests 

# Run stage
# Cargo lo que necesito para ejecutar
FROM openjdk:8-alpine 
# Cojo la build que hice en el stage de build y la muevo a una ruta en el stage de run
COPY --from=build /home/app/target/ListaInvitados-0.0.1-SNAPSHOT.war /usr/share/app.war 
ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/share/app.war"]