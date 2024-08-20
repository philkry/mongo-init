# Use an official MongoDB image as the base image
FROM mongo:latest

# Create a directory for the script
RUN mkdir -p /usr/local/bin

# Add the script to the image
COPY init-db.sh /usr/local/bin/init-db.sh

# Make the script executable
RUN chmod +x /usr/local/bin/init-db.sh

# Set the entrypoint to run the script
ENTRYPOINT ["/usr/local/bin/init-db.sh"]
