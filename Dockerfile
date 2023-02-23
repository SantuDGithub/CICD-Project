# Use an official Nginx runtime as the base image
FROM nginx

# Copy custom configuration file to the container
COPY sample-site/html/* /etc/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the default Nginx port
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
