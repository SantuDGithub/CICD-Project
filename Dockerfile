# Use an official Nginx runtime as the base image
FROM nginx

# Copy custom configuration file to the container
COPY . .

# Expose the default Nginx port
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
