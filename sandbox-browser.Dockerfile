FROM openclaw-sandbox-base:latest

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    chromium \
    fonts-liberation \
    fonts-noto-color-emoji \
    novnc \
    socat \
    websockify \
    x11vnc \
    xvfb \
  && rm -rf /var/lib/apt/lists/*

COPY scripts/sandbox-browser-entrypoint.sh /usr/local/bin/openclaw-sandbox-browser
RUN chmod 755 /usr/local/bin/openclaw-sandbox-browser

USER sandbox
WORKDIR /home/sandbox

EXPOSE 9222 5900 6080

CMD ["openclaw-sandbox-browser"]
