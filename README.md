# Node.js App with MongoDB & Nexus Repository

A containerized full-stack environment featuring a Node.js Express application, MongoDB for data storage, and Sonatype Nexus for private Docker image management.

## Architecture Overview

- **App:** Node.js Express service (Port 3000)
- **Database:** MongoDB (Port 27017)
- **Nexus:** Artifact & Docker Registry (UI: 8081, Docker: 8082)
- **CI/CD:** GitHub Actions via Self-Hosted Runner

---

## Prerequisites

- Docker and Docker Compose installed
- GitHub Self-Hosted Runner (for CI/CD)
- Port 8081, 8082, 3000, and 27017 available

---

## Getting Started

### 1. Environment Configuration
Create a `.env` file in the root directory to store your credentials:

```env
MONGO_USER=admin
MONGO_PASS=your_password
MONGO_DB=myapp
NEXUS_PORT_UI=8081
NEXUS_PORT_DOCKER=8082
```

### 2. Launch Services
``` docker-compose up -d ```

### 3. Retrieve Initial Nexus Password
Wait 5 minutes for Nexus to initialize, then run;
``` docker exec nexus cat /nexus-data/admin.password ```

## Docker Registry Setup (Nexus)
To push to the local Nexus registry, you must allow;

### 1. Add the following to your daemon.json:
``` {"insecure-registries": ["localhost:8082"]} ```

### 2. Restart Docker
### 3. Login to the registry:
``` docker login localhost:8082 ```

## GitHub Actions Integration
This project uses Self-Hosted Runner to build and push images to the internal Nexus registry.

### Required GitHub Secrets
Go to Settings > Secrets > Actions and add:
**NEXUS_USERNAME**: Your Nexus admin username
**NEXUS_PASSWORD**: Your Nexus admin password

## Workflow Path
```.github/workflows/nexus-deploy.yml ``` triggers on every push to master

## License
MIT