FROM python:3.9-slim

# Install minimal dependencies for PySide6
RUN apt-get update && apt-get install -y \
    libgl1 \
    libgl1-mesa-glx \
    libegl1 \
    && rm -rf /var/lib/apt/lists/*

# Install PySide6
RUN pip install PySide6

WORKDIR /app
COPY app.py .

CMD ["python", "app.py"]
