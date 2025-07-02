# Use the official n8n image from n8n.io as the base
FROM docker.n8n.io/n8nio/n8n

# Switch to root to install packages
USER root

delete this text to work and deploy it
# Install system dependencies for building Python packages and audio libraries
RUN apk add --no-cache \
    ffmpeg \
    openssl \
    yt-dlp




