FROM socialengine/nginx-spa:latest

# Copy the built Flutter web app into the Docker container
COPY ./build/web /app

# Set secure permissions - read and execute for owner and group, read for others
RUN chmod -R 755 /app

# Expose the default HTTP port (80)
EXPOSE 80
