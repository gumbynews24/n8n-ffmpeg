# Use the official n8n image from n8n.io as the base
#FROM docker.n8n.io/n8nio/n8n
FROM docker.n8n.io/n8nio/n8n

# Switch to root to install packages
USER root
RUN apt update && apt install -y ffmpeg
# Install system dependencies for building Python packages and audio libraries
#RUN apk add --no-cache \
 #   ffmpeg \
  #  openssl \
   # yt-dlp




