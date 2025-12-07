FROM python:3.11-slim

WORKDIR /app

# Systemabhängigkeiten (optional, z.B. für uvicorn)
RUN pip install --no-cache-dir fastapi "uvicorn[standard]"

# Projektdateien kopieren
COPY . /app

# App starten
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
