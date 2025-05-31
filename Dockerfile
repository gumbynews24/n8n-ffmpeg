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

# Install KOKORO-TTS (Text to Speech)
RUN git clone https://github.com/gumbynews24/kokoro-tts.git && \
cd kokoro-tts && \
pip install -r requirements.txt

RUN wget https://github.com/nazdridoy/kokoro-tts/releases/download/v1.0.0/voices-v1.0.bin
RUN wget https://github.com/nazdridoy/kokoro-tts/releases/download/v1.0.0/kokoro-v1.0.onnx
