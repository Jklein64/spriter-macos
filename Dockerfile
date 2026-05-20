FROM ubuntu:14.04

# Fetch dependencies
RUN apt-get update && apt-get install -y \
    dbus \
    fontconfig \
    libfreetype6 \
    libgl1-mesa-glx \
    libgomp1 \
    libglib2.0-0 \
    libgstreamer-plugins-base0.10-0 \
    libpulse0 \
    libsm6 \
    libx11-6 \
    libxcomposite1 \
    libxext6 \
    libxi6 \
    libxrender1 \
    libxtst6 \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/src
# Download and extract Spriter software
RUN wget https://brashmonkey.com/brashmonkey/spriter/linux/Spriter_free_R10.tar.gz && \
    tar -xvzf Spriter_free_R10.tar.gz
# Add it to PATH
ENV PATH="/usr/local/src/SpriterR10(64):$PATH"
# Fix for a Qt plugins bug
ENV QT_PLUGIN_PATH="/usr/local/src/SpriterR10(64)/plugins"
    
WORKDIR /root
CMD [ "Spriter" ]