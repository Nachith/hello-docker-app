# Use Ubuntu 22.04 LTS
FROM ubuntu:22.04

# Prevent interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    xvfb \
    fluxbox \
    x11vnc \
    novnc \
    websockify \
    libgl1 \
    libxkbcommon0 \
    libxrender1 \
    libxext6 \
    libx11-6 \
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

# Start X virtual framebuffer, window manager, VNC server, noVNC, and run the app
CMD bash -c "\
Xvfb :1 -screen 0 1024x768x16 & \
fluxbox & \
x11vnc -display :1 -forever -nopw -shared & \
websockify -D --web=/usr/share/novnc/ 6080 localhost:5900 & \
python3 app.py"
