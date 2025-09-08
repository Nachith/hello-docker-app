FROM python:3.11

# Install system packages
RUN apt-get update && apt-get install -y \
    python3-pip \
    x11-apps \
    libgl1 \
    libegl1 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxrandr2 \
    libxi6 \
    libxkbcommon0 \
    x11vnc \
    xvfb \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install PySide6
RUN pip install PySide6

# Set working directory
WORKDIR /app
COPY gui_calculator.py .

# Download noVNC
RUN wget https://github.com/novnc/noVNC/archive/refs/heads/master.zip -O novnc.zip && \
    unzip novnc.zip && mv noVNC-master /opt/noVNC && rm novnc.zip

# Expose noVNC web port
EXPOSE 6080

# Start Xvfb + x11vnc + noVNC + Python GUI
CMD bash -c "\
    Xvfb :1 -screen 0 1024x768x16 & \
    export DISPLAY=:1 && \
    x11vnc -display :1 -forever -nopw & \
    /opt/noVNC/utils/launch.sh --vnc localhost:5900 & \
    python gui_calculator.py"
