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
    
WORKDIR /root
# Copy config folder (mainly for openGLEnabled=false)
COPY .config .config

# Create volume mount point. This can't be /root because Spriter expects the
# config to be in /root, and mounting would overwrite any config we write there.
RUN mkdir /root/volume
WORKDIR /root/volume

# Fix for a Qt plugins bug
ENV QT_PLUGIN_PATH="/usr/local/src/SpriterR10(64)/plugins"
    
CMD [ "/usr/local/src/SpriterR10(64)/Spriter" ]