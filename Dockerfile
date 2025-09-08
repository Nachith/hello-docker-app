#Use pyhton base image

FROM python:3.11-slim

#install dependencies for GUI (x11 support)

RUN apt-get update && apt-get install -y \
    libxkbcommon-x11-0 \
    libxcb-cursor0 \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

#set working directory
WORKDIR /app

#copy files
COPY requirement.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

#run the app
CMD ["python", "app.py"]