FROM python:3.11-slim

WORKDIR /app

COPY calculator.py .
COPY requirements.txt .

#Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "calculator.py"]