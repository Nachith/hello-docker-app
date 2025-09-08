# Base image with Python
FROM python:3.12-slim

# Install required packages for PySide6 GUI
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libx11-dev \
    libxext-dev \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PySide6
RUN pip install --no-cache-dir PySide6

# Set working directory
WORKDIR /app

# Copy project files
COPY app.py .

# Set display environment variable for GUI
ENV DISPLAY=:0

# Run the app
CMD ["python", "app.py"]
