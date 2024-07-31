FROM alpine:latest

RUN mkdir /app
WORKDIR /app
EXPOSE 1143
COPY . /app
RUN chmod +x /app/http-proxy-server
ENTRYPOINT ["/app/http-proxy-server", "--port", "1143"]
