# Use the official NGINX image from Docker Hub as a base image
FROM nginx:latest

# Enable the NGINX stream module (it is already included in the base NGINX image)
RUN echo "load_module modules/ngx_stream_module.so;" > /etc/nginx/modules.conf

# Copy a custom NGINX configuration to include the stream block
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the ports for HTTP (80) and TCP/UDP streams (for example 1234)
EXPOSE 80 1234

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
