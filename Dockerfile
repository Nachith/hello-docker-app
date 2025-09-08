# Use Ubuntu 22.04 LTS
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies including Qt xcb libraries
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    xvfb \
    fluxbox \
    x11vnc \
    novnc \
    websockify \
    libgl1 \
    libegl1 \
    libxrender1 \
    libxext6 \
    libx11-6 \
    libxcb1 \
    libxcb-cursor0 \
    libxcb-keysyms1 \
    libxcb-image0 \
    libxcb-render0 \
    libxcb-render-util0 \
    libxcb-shape0 \
    libxcb-randr0 \
    libxcb-xfixes0 \
    libxcb-shm0 \
    libxcb-xinerama0 \
    libxcb-xkb1 \
    libxkbcommon-x11-0 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy app code
COPY app.py .
COPY requirements.txt .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Expose noVNC port
EXPOSE 6080

# Start Xvfb, fluxbox, x11vnc, noVNC, and the PySide6 app
CMD bash -c "\
Xvfb :1 -screen 0 1024x768x16 & \
fluxbox & \
x11vnc -display :1 -forever -nopw -shared & \
websockify -D --web=/usr/share/novnc/ 6080 localhost:5900 & \
python3 app.py"
