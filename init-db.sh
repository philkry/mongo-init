#!/bin/bash

# Variables
MONGO_HOST=${MONGO_HOST:-"mongodb://mongodb:27017"}
DB_NAME=${DB_NAME:-"mydatabase"}
DB_USER=${DB_USER:-"myuser"}
DB_PASS=${DB_PASS:-"mypassword"}
ROOT_USER=${ROOT_USER:-"root"}
ROOT_PASS=${ROOT_PASS:-"rootpassword"}

# Wait for MongoDB to be ready
until mongo $MONGO_HOST/admin -u $ROOT_USER -p $ROOT_PASS --eval "print(\"waited for connection\")"; do
  >&2 echo "MongoDB is unavailable - sleeping"
  sleep 2
done

# Create the database and user
mongo $MONGO_HOST/admin -u $ROOT_USER -p $ROOT_PASS --eval "db.getSiblingDB('$DB_NAME').createUser({user: '$DB_USER', pwd: '$DB_PASS', roles: [{role: 'readWrite', db: '$DB_NAME'}]});"

# Exit after the script is executed
echo "MongoDB user and database created successfully."
