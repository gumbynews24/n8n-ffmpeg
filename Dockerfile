# Use the official n8n image from n8n.io as the base
FROM docker.n8n.io/n8nio/n8n

# Switch to root to install packages
USER root

# Install system dependencies for building Python packages and audio libraries
RUN apk add --no-cache \
    ffmpeg \
    openssl \
    yt-dlp

# Install Python and other dependencies (example)
RUN apk add python py3-pip

# Install Kokoro-onnx (assuming that's the relevant package)
RUN apk add kokoro-onnx

# Download the model files (example, replace with the actual download command)
RUN wget -q -O kokoro-v1.onnx https://github.com/nazdridoy/kokoro-tts/releases/download/v1.0.0/kokoro-v1.0.onnx
RUN wget -q -O https://github.com/nazdridoy/kokoro-tts/releases/download/v1.0.0/voices-v1.0.bin

# Clone kokoro-tts repository
# RUN git clone https://github.com/nazdridoy/kokoro-tts.git
# WORKDIR /kokoro-tts


