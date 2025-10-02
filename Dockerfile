FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/


RUN mkdir -p /app/staticfiles /app/media

EXPOSE 8000


CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000", "--workers=4"]
