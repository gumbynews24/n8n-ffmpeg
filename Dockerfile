# Use the official n8n image from n8n.io as the base
FROM docker.n8n.io/n8nio/n8n

# Switch to root to install packages
USER root

# Install system dependencies for building Python packages and audio libraries
RUN apk add --no-cache \
    git \
    python3 \
    py3-pip \
    python3-dev \
    build-base \
    libffi-dev \
    portaudio-dev \
    alsa-lib-dev \
    ffmpeg \
    openssl \
    pipx \
    libjpeg-turbo-dev \
    zlib-dev \
    freetype-dev \
    openblas-dev \
    cmake \
    espeak-ng \
    wget \
    bash \
    yt-dlp


# Clone kokoro-tts repository
#RUN git clone https://github.com/nazdridoy/kokoro-tts.git
# WORKDIR /kokoro-tts
