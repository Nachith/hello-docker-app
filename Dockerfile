# Use full Python image with Debian (not slim)
FROM python:3.11

# Install dependencies for GUI
RUN apt-get update && apt-get install -y \
    x11-apps \
    libgl1 \
    libxcb1 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxrandr2 \
    libxi6 \
    libxkbcommon0 \
    && rm -rf /var/lib/apt/lists/*


# Set working directory
WORKDIR /app

# Copy app files
COPY gui_calculator.py .
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run the GUI app
CMD ["python", "gui_calculator.py"]
