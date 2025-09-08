FROM python:3.11

WORKDIR /app

COPY app.py /app.py

CMD ["python", "/app.py"]