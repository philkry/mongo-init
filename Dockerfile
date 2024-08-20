# Use an official MongoDB image as the base image
FROM rtsp/mongosh:2.3.0@sha256:e475dffadf38a5e84f4abc6cef8960445bc3ec9c69b29ff5ac2a445b20758aec
LABEL org.opencontainers.image.description Init-Container to create MongoDB database and user
# Create a directory for the script
RUN mkdir -p /usr/local/bin

# Add the script to the image
COPY init-db.sh /usr/local/bin/init-db.sh

# Make the script executable
RUN chmod +x /usr/local/bin/init-db.sh

# Set the entrypoint to run the script
ENTRYPOINT ["/usr/local/bin/init-db.sh"]
