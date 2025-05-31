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

# Upgrade pip and setuptools
#UN pipx install --upgrade pip setuptools

# Clone kokoro-tts repository
RUN git clone https://github.com/nazdridoy/kokoro-tts.git /kokoro-tts

# Set working directory
WORKDIR /kokoro-tts

# Install Python dependencies from requirements.txt
RUN pipx install -r requirements.txt

# Download model files
RUN wget https://github.com/nazdridoy/kokoro-tts/releases/download/v1.0.0/voices-v1.0.bin && \
    wget https://github.com/nazdridoy/kokoro-tts/releases/download/v1.0.0/kokoro-v1.0.onnx

# Optional: Clone the kokoro-tts repo (if needed for code)
# RUN git clone https://github.com/gumbynews24/kokoro-tts.git
