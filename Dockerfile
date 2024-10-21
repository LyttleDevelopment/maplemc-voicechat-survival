# Use the official NGINX image from Docker Hub
FROM nginx:latest

# Install gettext (for envsubst)
RUN apt-get update && apt-get install -y gettext-base

# Enable the NGINX stream module
RUN echo "load_module modules/ngx_stream_module.so;" > /etc/nginx/modules.conf

# Copy the NGINX configuration template
COPY nginx.conf /etc/nginx/nginx.conf.template

# Expose necessary ports
EXPOSE 24454

# At runtime, substitute environment variables into the NGINX config
CMD /bin/bash -c "envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"
