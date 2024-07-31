FROM alpine:latest

RUN mkdir /app
WORKDIR /app
EXPOSE 1143
COPY . /app
CMD ./http-proxy-server --port 1143
#CMD cd TelegramShellBot-Rclone && . ./setup.sh && bash start.sh
