# Use the official Nginx image from the Docker Hub
FROM nginx:latest

# Copy your custom configuration file to the Nginx configuration directory
COPY nginx.conf /etc/nginx/nginx.conf

# Copy static website content to the Nginx HTML directory
COPY html /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80
