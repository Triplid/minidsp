#!/usr/bin/with-contenv bash
# Этот скрипт запускается автоматически через s6-overlay при старте контейнера

echo "Starting miniDSP Python API..."
# Запускаем gunicorn из venv без exec, чтобы PID=1 оставался за s6
/opt/venv/bin/gunicorn --bind 0.0.0.0:8080 api:app
