#!/usr/bin/with-contenv bash
echo "Starting miniDSP API..."
# gunicorn или python скрипт из venv
/opt/venv/bin/gunicorn --bind 0.0.0.0:8080 api:app
