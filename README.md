# mtslinker

`mtslinker` - это проект для загрузки и обработки записей вебинаров, предоставляемых сервисом MTS Link. Проект автоматически загружает видео и аудиофайлы вебинаров, синхронизирует их и создает финальный видеоролик.

## Установка

Для установки проекта рекомендуется использовать [Poetry](https://python-poetry.org/), а так же Python 3.12 или выше.

1. Клонируйте репозиторий:
    ```bash
    git clone https://github.com/motattack/mtslinker.git
    cd mtslinker
    ```

2. Установите зависимости:
    ```bash
    poetry install
    ```
   или
   ```angular2html
   pip install -r requirements.txt
   ```

## Использование
Чтобы запустить проект, выполните следующий код:

```python
from mtslinker.webinar import fetch_webinar_data

fetch_webinar_data(
  event_sessions='476183303',
  record_id='1036895455',
  # session_id='2121' # optional
)