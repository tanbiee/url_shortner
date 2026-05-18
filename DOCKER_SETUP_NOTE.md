# Docker Compose Configuration Moved

The `docker-compose.yml` file has been moved to the project root directory at `/short-url/docker-compose.yml` to support both the Node.js and Java/Spring Boot applications together.

## Running the Application

From the project root directory, use:

```bash
docker-compose up --build
```

Or use the convenience scripts:
- **Linux/macOS**: `./start.sh`
- **Windows**: `start.bat`

## Why?

- Unified configuration for both applications and all services
- Single Docker network for inter-service communication
- Easier orchestration of MongoDB, Redis, Node.js, and Java apps
- Simplified CI/CD pipeline

See `../DOCKER_SETUP.md` for full documentation.
