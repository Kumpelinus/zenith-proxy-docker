# Zenith Proxy Docker Build

[![Pipeline Status](https://img.shields.io/github/actions/workflow/status/Kumpelinus/zenith-proxy-docker/docker-image.yml?logo=github&label=docker%20build)](https://github.com/Kumpelinus/zenith-proxy-docker/actions/workflows/docker-image.yml)
[![Docker Image Version](https://img.shields.io/docker/v/kumpelinus/zenith-proxy?sort=semver)](https://hub.docker.com/r/kumpelinus/zenith-proxy)

## Overview

This repository automates the build and deployment of Docker images for the [Zenith Proxy](https://github.com/rfresh2/ZenithProxy) project. Using GitHub Actions, the pipeline:
- Polls the upstream repository for changes on multiple branches.
- Builds Docker images using a multi-stage Dockerfile (leveraging Alpine and OpenJDK 17).
- Tags images with both branch names and commit hashes.
- Pushes the images to Docker Hub—with one branch optionally tagged as `latest`.

## Features

- **Automated CI/CD:**
  Scheduled GitHub Actions workflows check for updates in the upstream project and trigger builds accordingly.

- **Versioned Tagging:**
  Each Docker image is tagged with the branch name, commit hash, and for one primary branch, the `latest` tag.

## Getting Started

### Build Locally

To build the Docker image for a specific branch locally:

```bash
docker build --build-arg BRANCH=1.21.4 -t kumpelinus/zenith-proxy:1.21.4 .
```

### Run the Container

To run the Docker image:

```bash
docker run -d -p 25581:25565 kumpelinus/zenith-proxy:1.21.4
```

or use the [docker compose file](https://github.com/Kumpelinus/zenith-proxy-docker/blob/main/docker-compose.yml)
