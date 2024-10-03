
# MongoDB Initialization Container

## Overview

This project provides a Docker container and associated scripts for initializing a MongoDB database and user. It's designed to be used as an init container in Kubernetes deployments, ensuring that the required database and user are set up before the main application starts.

## Contents

1. **Dockerfile**: Defines the container image based on the official MongoDB image.
2. **init-db.sh**: Bash script that creates the MongoDB database and user.
3. **README.md**: Project documentation and usage instructions.
4. **GitHub Actions Workflow**: Automates the building and publishing of the Docker image.

## Inputs

The initialization script accepts the following environment variables:

| Variable | Default Value | Description |
|----------|---------------|-------------|
| MONGO_HOST | mongodb://mongodb:27017 | MongoDB connection string |
| MONGO_DB_NAME | mydatabase | Name of the database to create |
| MONGO_DB_USER | myuser | Username for the new database user |
| MONGO_DB_PASS | mypassword | Password for the new database user |
| MONGO_ROOT_USER | root | Root username for MongoDB instance |
| MONGO_ROOT_PASS | rootpassword | Root password for MongoDB instance |

## Process

1. The container starts and runs the `init-db.sh` script.
2. The script waits for the MongoDB instance to be ready.
3. Once MongoDB is available, it creates the specified database and user.
4. The user is granted `readWrite` permissions on the new database.

## Outputs

- A new MongoDB database is created with the specified name.
- A new user is created with `readWrite` permissions on the new database.
- The script outputs "MongoDB user and database created successfully." upon completion.

## Usage

1. Deploy this container as an init container in your Kubernetes deployment.
2. Set the required environment variables to customize the database and user creation.
3. The init container will run before your main application container, ensuring the database is properly set up.

## Building and Publishing

The included GitHub Actions workflow automatically builds and publishes the Docker image to GitHub Container Registry (ghcr.io) when changes are pushed to the main branch or when a new tag is created.

## Security Considerations

- The workflow signs the Docker image using Cosign for enhanced security.
- Sensitive information (like database credentials) should be managed securely, preferably using Kubernetes Secrets or a similar mechanism in production environments.
