# mongo-init
Tiny script to create MongoDB database and user. To be used as init-container on k8s deployments.


## Expected environment variables

|Variable|Default Value|Description|
|---|---|---|
|MONGO_HOST |mongodb://mongodb:27017|MongoDB connection string|
|MONGO_DB_NAME    |mydatabase|Database to create|
|MONGO_DB_USER    |myuser|User to create and grant readWrite to new DB|
|MONGO_DB_PASS    |mypassword|Password of new user|
|MONGO_ROOT_USER  |root|Root user of MongoDB instance|
|MONGO_ROOT_PASS  |rootpassword|Root user password|
