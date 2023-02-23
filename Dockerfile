# Use an official Nginx runtime as the base image
FROM nginx:latest

mkdir tmp-context 
COPY -R ../html tmp-context/
COPY -R ../../config tmp-context/

# Copy custom configuration file to the container
COPY sample-site/html/* /etc/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the default Nginx port
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
