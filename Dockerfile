FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copy the jar file built by Jenkins directly into the image
COPY target/url-shortener-*.jar app.jar

EXPOSE 8081

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=15s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8081/actuator/health || exit 1

ENTRYPOINT ["java", "-jar", "app.jar"]
