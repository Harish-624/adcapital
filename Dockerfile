# ---------- Build ----------
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ---------- Runtime ----------
FROM tomcat:9.0-jre17
WORKDIR /usr/local/tomcat/webapps/

# Clear existing Tomcat webapps to make our app the ROOT
RUN rm -rf *

# Copy the built WAR as ROOT.war so it serves at the root path (/)
COPY --from=build /app/target/*.war ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
