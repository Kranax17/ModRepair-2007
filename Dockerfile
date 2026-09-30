FROM python:3.11-slim

WORKDIR /tuberepair-python

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN yt-dlp --version

COPY . .

CMD ["sh", "-c", "pip install --no-cache-dir -U 'yt-dlp[default]' && python tuberepair/main.py"]
