# Basis-Image auswählen
FROM python:3.9-slim

# Arbeitsverzeichnis erstellen
WORKDIR /app

# Kopiere das Python-Skript ins Arbeitsverzeichnis
COPY . .

# Crontab installieren
RUN apt-get update && apt-get install -y cron

# Installiere notwendige Abhängigkeiten (hier nur requests)
RUN pip install requests

# Erstelle Crontab-Eintrag für das Python-Skript
RUN echo "* * * * * /usr/local/bin/python /app/app.py >> /var/log/cron.log 2>&1" > /etc/cron.d/send_data_cron

# Berechtigungen für die Crontab-Datei setzen
RUN chmod 0644 /etc/cron.d/send_data_cron

# Crontab für den Benutzer laden
RUN crontab /etc/cron.d/send_data_cron

# Cron-Service starten
CMD ["cron", "-f"]
