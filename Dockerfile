# Use the official n8n image from n8n.io as the base
FROM docker.n8n.io/n8nio/n8n

# Switch to root to install packages
USER root

# Install Docker CLI and ffmpeg
RUN apk add --no-cache \
    ca-certificates \
    Docker CLI \
    ffmpeg \
    openssl \
    aria2

RUN apk add yt-dlp


