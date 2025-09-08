FROM python:3.9-slim

# Install dependencies for PySide6 and XCB
RUN apt-get update && apt-get install -y \
    libgl1 \
    libgl1-mesa-glx \
    libegl1 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxcb1 \
    libxkbcommon0 \
    libdbus-1-3 \
    libxcb-xinerama0 \
    libxcb-cursor0 \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# Install PySide6
RUN pip install PySide6

# Set working directory
WORKDIR /app
COPY app.py .

# Run app inside Xvfb
CMD ["xvfb-run", "-a", "python", "app.py"]
