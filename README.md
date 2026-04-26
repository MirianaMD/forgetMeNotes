# ForgetMeNotes 🛡️📝

A simple Notes App built with Node.js and Express, containerized with Docker and secured through a DevSecOps pipeline using GitHub Actions.

## Features

- Create and delete notes  
- REST API for note management  
- Dockerized application  
- Dependency vulnerability scanning  
- Docker image scanning with Trivy  
- Automated health check in CI pipeline

---

## Tech Stack

- Node.js 20  
- Express  
- Docker  
- GitHub Actions  
- Trivy  
- npm audit

---

## Project Structure

```bash
.
├── app/
│   ├── index.js
│   ├── package.json
│   └── public/index.html
├── .github/workflows/devsecops-pipeline.yml
└── Dockerfile
```

---

## Run Locally

Install dependencies:

```bash
cd app
npm install
```

Start app:

```bash
npm start
```

Runs on:

```bash
http://localhost:3000
```

---

## Run with Docker

Build image:

```bash
docker build -t devsecops-notes .
```

Run container:

```bash
docker run -p 3000:3000 devsecops-notes
```

---

# DevSecOps Pipeline

Workflow runs on every push or pull request to `main`.

## Pipeline Stages

### 1. Build & Lint

- Installs dependencies  
- Runs ESLint static analysis

```bash
npx eslint .
```

---

### 2. Dependency Scan

Checks vulnerabilities with:

```bash
npm audit --audit-level=high
```

Fails on high severity issues.

---

### 3. Docker Security Scan

Builds image:

```bash
docker build -t devsecops-notes:latest .
```

Scans image using Trivy for **critical vulnerabilities**.

---

### 4. Health Check

Runs container and validates:

```bash
curl http://localhost:3000/health
```

Confirms application starts correctly inside Docker.

---

## Pipeline Flow

```text
Build & Lint
↓
Dependency Scan
↓
Docker Scan
↓
Health Check
```

---

## Security Controls

Included DevSecOps checks:

- SAST → ESLint  
- SCA → npm audit  
- Container Scan → Trivy  
- Runtime Validation → /health endpoint

---
