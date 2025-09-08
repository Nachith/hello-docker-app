FROM python:3.9-slim

# Install all dependencies required for PySide6 and XCB
RUN apt-get update && apt-get install -y \
    libgl1 \
    libgl1-mesa-glx \
    libegl1 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxcb1 \
    libxcb-xinerama0 \
    libxcb-cursor0 \
    libxcb-keysyms1 \
    libxcb-image0 \
    libxcb-icccm4 \
    libxcb-sync1 \
    libxcb-randr0 \
    libxcb-shape0 \
    libxcb-shm0 \
    libxcb-util1 \
    libxkbcommon0 \
    libdbus-1-3 \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# Install PySide6
RUN pip install PySide6

# Set working directory
WORKDIR /app
COPY app.py .

# Run PySide6 app inside a virtual framebuffer (headless)
CMD ["xvfb-run", "-a", "python", "app.py"]
