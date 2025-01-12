# Use Ubuntu as the base image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy the script into the container
COPY wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Expose the application port
EXPOSE 4499

# Run the script when the container starts
CMD ["bash", "/app/wisecow.sh"]
