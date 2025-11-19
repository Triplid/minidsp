ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.0.0
FROM ${BUILD_FROM}

# Устанавливаем Python и bash
RUN apk add --no-cache python3 py3-virtualenv bash

# Создаём виртуальное окружение
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Копируем requirements и устанавливаем в venv
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Копируем API и скрипт запуска
COPY api.py /app/api.py
COPY etc/cont-init.d/run.sh /etc/cont-init.d/run.sh
RUN chmod a+x /etc/cont-init.d/run.sh

WORKDIR /app
EXPOSE 8080
