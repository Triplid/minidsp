ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.0.0
FROM ${BUILD_FROM}

RUN apk add --no-cache python3 py3-virtualenv bash

# создаём виртуальное окружение
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# устанавливаем зависимости в venv
COPY requirements.txt /tmp/requirements.txt
RUN /opt/venv/bin/pip install --no-cache-dir -r /tmp/requirements.txt

# копируем API и скрипт запуска
COPY api.py /app/api.py
COPY etc/cont-init.d/run.sh /etc/cont-init.d/run.sh
RUN chmod a+x /etc/cont-init.d/run.sh

WORKDIR /app
EXPOSE 8080

# CMD убираем — HA Base Image управляет s6-overlay
