FROM python:3.13-slim

WORKDIR /app

# Устанавливаем ffmpeg
RUN apt-get update && apt-get install -y \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Проверяем зависимости FFmpeg
RUN ldd /usr/bin/ffmpeg && \
    ffmpeg -version && \
    ffmpeg -hide_banner -codecs | grep -q "aac" && \
    ffmpeg -hide_banner -codecs | grep -q "h264" && \
    echo "✅ ffmpeg готов к работе (AAC/H.264 доступны)"

# Копируем только requirements.txt сначала для кэширования
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Копируем остальные файлы проекта
COPY . .

# Устанавливаем пакет (если он setup как пакет)
RUN if [ -f "setup.py" ]; then pip install --no-cache-dir .; fi

ENTRYPOINT ["mtslinker"]

