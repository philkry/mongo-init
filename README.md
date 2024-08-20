# mongo-init
Tiny script to create MongoDB database and user. To be used as init-container on k8s deployments.


## Expected environment variables

|Variable|Default Value|Description|
|---|---|---|
|MONGO_HOST |mongodb://mongodb:27017|MongoDB connection string|
|DB_NAME    |mydatabase|Database to create|
|DB_USER    |myuser|User to create and grant readWrite to new DB|
|DB_PASS    |mypassword|Password of new user|
|ROOT_USER  |root|Root user of MongoDB instance|
|ROOT_PASS  |rootpassword|Root user password|
