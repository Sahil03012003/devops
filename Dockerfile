# Use official Nginx image
FROM nginx:alpine

# Copy static website files to Nginx's default directory
COPY class-registration-site/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
