ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.0.0
FROM ${BUILD_FROM}

# Устанавливаем Python и зависимости
RUN apk add --no-cache python3 py3-pip bash

COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Копируем API и скрипт запуска
COPY api.py /app/api.py
COPY etc/cont-init.d/run.sh /etc/cont-init.d/run.sh
RUN chmod a+x /etc/cont-init.d/run.sh

WORKDIR /app
EXPOSE 8080
