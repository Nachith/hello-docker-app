FROM python:3.11-slim

# Install necessary packages for GUI
RUN apt-get update && apt-get install -y \
    python3-pyqt5.qtwebkit \
    libgl1-mesa-glx \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY gui_calculator.py .
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "gui_calculator.py"]
