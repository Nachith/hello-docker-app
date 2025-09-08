# Use lightweight Python base image
FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    libgl1 \
    libx11-6 \
    && rm -rf /var/lib/apt/lists/*

# Install PySide6
RUN pip install PySide6

# Set working directory
WORKDIR /app

# Copy code into container
COPY app.py .

# Default command
CMD ["python", "app.py"]
