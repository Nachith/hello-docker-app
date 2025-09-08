# Use lightweight Python base image
FROM python:3.9-slim

# Install system dependencies required for PySide6
RUN apt-get update && apt-get install -y \
    libgl1 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxcb1 \
    libxkbcommon0 \
    libdbus-1-3 \
    && rm -rf /var/lib/apt/lists/*

# Install PySide6
RUN pip install PySide6

# Set working directory
WORKDIR /app

# Copy code into container
COPY app.py .

# Default command
CMD ["python", "app.py"]
