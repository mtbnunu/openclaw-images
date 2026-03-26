# syntax=docker/dockerfile:1.7

FROM openclaw-sandbox-base:latest

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN --mount=type=cache,id=openclaw-sandbox-bookworm-apt-cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,id=openclaw-sandbox-bookworm-apt-lists,target=/var/lib/apt,sharing=locked \
  apt-get update \
  && apt-get install -y --no-install-recommends \
    chromium \
    fonts-liberation \
    fonts-noto-color-emoji \
    novnc \
    socat \
    websockify \
    x11vnc \
    xvfb

COPY --chmod=755 scripts/sandbox-browser-entrypoint.sh /usr/local/bin/openclaw-sandbox-browser

USER sandbox
WORKDIR /home/sandbox

EXPOSE 9222 5900 6080

CMD ["openclaw-sandbox-browser"]
