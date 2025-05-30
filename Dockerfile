# Use the official n8n image from n8n.io as the base
FROM docker.n8n.io/n8nio/n8n

# Switch to root to install packages
USER root

# Install Docker CLI and ffmpeg
RUN apk add --no-cache ca-certificates
RUN apk add --no-cache Docker CLI 
RUN apk add --no-cache ffmpeg 
RUN apk add --no-cache openssl 

RUN apk add yt-dlp


