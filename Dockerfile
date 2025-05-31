# Use the official n8n image from n8n.io as the base
FROM docker.n8n.io/n8nio/n8n

# Switch to root to install packages
USER root

# Install required system dependencies
RUN apk add --no-cache \
  python3 \
  py3-pip \
  py3-wheel \
  py3-setuptools \
  ffmpeg \
  openssl \
  yt-dlp \
  build-base \
  libffi-dev \
  portaudio-dev \
  musl-dev \
  python3-dev \
  gcc

# Install Python packages required for kokoro-tts
RUN pip install --no-cache-dir \
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
