# Используем Alpine для маленького образа
FROM alpine:3.18

# Обновление и базовые пакеты
RUN apk add --no-cache \
python3 py3-pip \
build-base \
pkgconf \
libusb-dev \
linux-headers \
git \
cargo \
rust \
bash \
ca-certificates

# Устанавливаем Python-зависимости
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Компилируем minidsp (Rust CLI)
# Компиляция может занять время, но в контейнере это нормально
RUN cargo install minidsp --locked || true

# Если cargo установил бинарник в ~/.cargo/bin, скопируем его в /usr/local/bin
RUN if [ -f /root/.cargo/bin/minidsp ]; then cp /root/.cargo/bin/minidsp /usr/local/bin/minidsp; fi

# Копируем API и скрипт запуска
COPY api.py /app/api.py
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

WORKDIR /app

EXPOSE 8080
CMD ["/app/run.sh"]
