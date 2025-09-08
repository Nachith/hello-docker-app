FROM python:3.12-slim

# Install system dependencies for PySide6 and VNC
RUN apt-get update && apt-get install -y \
    python3-pip \
    xvfb \
    x11vnc \
    fluxbox \
    libgl1-mesa-glx \
    libxkbcommon0 \
    libxrender1 \
    libxext6 \
    libx11-6 \
    && rm -rf /var/lib/apt/lists/*

# Install PySide6
RUN pip install --no-cache-dir PySide6

# Set working directory
WORKDIR /app
COPY app.py .

# Expose VNC port
EXPOSE 5900

# Start virtual framebuffer, window manager, VNC server, and run PySide6 app
CMD ["sh", "-c", "Xvfb :1 -screen 0 1024x768x16 & fluxbox & x11vnc -display :1 -forever -nopw -xkb & python app.py"]
