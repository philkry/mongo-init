#!/bin/bash

# Variables
MONGO_HOST=${MONGO_HOST:-"mongodb://mongodb:27017"}
MONGO_DB_NAME=${MONGO_DB_NAME:-"mydatabase"}
MONGO_DB_USER=${MONGO_DB_USER:-"myuser"}
MONGO_DB_PASS=${MONGO_DB_PASS:-"mypassword"}
MONGO_ROOT_USER=${MONGO_ROOT_USER:-"root"}
MONGO_ROOT_PASS=${MONGO_ROOT_PASS:-"rootpassword"}

# Wait for MongoDB to be ready
until mongosh $MONGO_HOST/admin -u $MONGO_ROOT_USER -p $MONGO_ROOT_PASS --eval "print(\"waited for connection\")"; do
  >&2 echo "MongoDB is unavailable - sleeping"
  sleep 2
done

# Create the database and user
mongosh $MONGO_HOST/admin -u $MONGO_ROOT_USER -p $MONGO_ROOT_PASS --eval "db.getSiblingDB('$MONGO_DB_NAME').createUser({user: '$MONGO_DB_USER', pwd: '$MONGO_DB_PASS', roles: [{role: 'readWrite', db: '$MONGO_DB_NAME'}]});"

# Exit after the script is executed
echo "MongoDB user and database created successfully."
