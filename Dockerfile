FROM python:3.12-slim

# Install PySide6 and VNC server
RUN apt-get update && apt-get install -y \
    python3-pip \
    xvfb \
    x11vnc \
    fluxbox \
    && rm -rf /var/lib/apt/lists/*

RUN pip install PySide6

WORKDIR /app
COPY app.py .

# Expose VNC port
EXPOSE 5900

CMD ["sh", "-c", "Xvfb :1 -screen 0 1024x768x16 & fluxbox & x11vnc -display :1 -forever -nopw & python app.py"]
