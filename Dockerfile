FROM python:3.9-slim

# Install system dependencies for PySide6 (Qt + X11 + OpenGL)
RUN apt-get update && apt-get install -y \
    libgl1 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxcb1 \
    libxkbcommon0 \
    libdbus-1-3 \
    libegl1 \
    libgles2 \
    mesa-utils \
    && rm -rf /var/lib/apt/lists/*

# Install PySide6
RUN pip install PySide6

# Set working directory
WORKDIR /app

# Copy code
COPY app.py .

# Run GUI app
CMD ["python", "app.py"]
