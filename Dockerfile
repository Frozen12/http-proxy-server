FROM alpine:latest

# Install necessary dependencies
RUN apk add --no-cache wget tar

# Create the app directory
RUN mkdir /app

# Set the working directory inside the container
WORKDIR /app

# Download and extract the binary
RUN wget "https://github.com/xzeldon/http-proxy-server/releases/download/v1.0.0/http-proxy-server-v1.0.0-linux-amd64.tar.gz" \
    && tar -xvzf "http-proxy-server-v1.0.0-linux-amd64.tar.gz" \
    && mv "http-proxy-server-v1.0.0-linux-amd64/http-proxy-server" /app/ \
    && rm -rf *http-proxy-server-v1.0.0-linux-amd64" "http-proxy-server-v1.0.0-linux-amd64.tar.gz"

# Ensure the binary has execution permissions
RUN chmod +x /app/http-proxy-server

# Expose the port that the application will run on
EXPOSE 1143

# Run the application
ENTRYPOINT ["/app/http-proxy-server"]
CMD ["--port", "1143"]
