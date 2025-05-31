# Use the official n8n image from n8n.io as the base
FROM docker.n8n.io/n8nio/n8n

# Switch to root to install packages
USER root

# Install Docker CLI and ffmpeg
RUN apk add --no-cache ca-certificates
# RUN apk add --no-cache Docker CLI 
RUN apk add --no-cache ffmpeg 
RUN apk add --no-cache openssl 

RUN apk add yt-dlp

# Install Python build dependencies required by kokoro-tts and its packages
RUN apk add --no-cache \
    gcc \
    g++ \
    musl-dev \
    libffi-dev \
    python3-dev \
    py3-pip \
    py3-setuptools \
    libstdc++ \
    libjpeg-turbo-dev \
    zlib-dev \
    freetype-dev \
    openblas-dev \
    portaudio-dev \
    alsa-lib-dev \
    ffmpeg \
    git

# Install Python packages required by kokoro-tts
RUN pip install --upgrade pip && pip install --no-cache-dir \
    beautifulsoup4 \
    ebooklib \
    PyMuPDF \
    kokoro-onnx==0.3.9 \
    pymupdf4llm \
    sounddevice \
    soundfile

# Download voice and model files
RUN wget https://github.com/nazdridoy/kokoro-tts/releases/download/v1.0.0/voices-v1.0.bin
RUN wget https://github.com/nazdridoy/kokoro-tts/releases/download/v1.0.0/kokoro-v1.0.onnx

# Optional: Clone the kokoro-tts repo (if needed for code)
# RUN git clone https://github.com/gumbynews24/kokoro-tts.git
