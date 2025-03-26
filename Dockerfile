# Stage 1: Build the project using Gradle
FROM gradle:8.13-jdk21 AS builder

ARG BRANCH=1.21.4
WORKDIR /app

# Install required tools
RUN apt-get update && apt-get install -y wget unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Download the zip archive from the specified branch and unzip it
RUN wget -O source.zip https://github.com/rfresh2/ZenithProxy/archive/refs/heads/${BRANCH}.zip && \
    unzip source.zip && rm source.zip

# Change into the unzipped repository directory (assumes naming convention)
WORKDIR /app/ZenithProxy-${BRANCH}

# Build the project using the Gradle wrapper (builds the executable jar)
RUN chmod +x gradlew && ./gradlew jarBuild

# Stage 2: Create the runtime image using a valid OpenJDK image
FROM openjdk:21-slim

ARG BRANCH=1.21.4

# Copy the built jar from the builder stage
COPY --from=builder /app/ZenithProxy-${BRANCH}/build/libs/ZenithProxy.jar /bin/ZenithProxy.jar

# Copy an entrypoint script that will initialize the volume if necessary
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /app

# Set the entrypoint to run the application
ENTRYPOINT ["/entrypoint.sh"]

