# Zenith Proxy Docker Build

[![Pipeline Status](https://github.com/Kumpelinus/zenith-proxy-docker/workflows/docker-image.yml/badge.svg)](https://github.com/Kumpelinus/zenith-proxy-docker/actions/workflows/docker-image.yml)
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

- **Multi-Branch Builds:**
  Build images for different branches (e.g., `1.21.0` and `1.21.4`) simultaneously using a matrix strategy.

- **Versioned Tagging:**
  Each Docker image is tagged with the branch name, commit hash, and for one primary branch, the `latest` tag.

- **Efficient Builds:**
  Multi-stage Docker builds based on Alpine and OpenJDK 17 keep images lean and fast.

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

or use the [docker compose file](docker-compose.yml)
