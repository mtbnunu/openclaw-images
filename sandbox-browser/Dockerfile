FROM openclaw-sandbox-base:latest

USER root

ENV DEBIAN_FRONTEND=noninteractive

# ─── System packages (changes rarely) ───
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
    python3-pip \
    python3-venv \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm1 \
    libpango-1.0-0 \
    libcairo2 \
    libasound2 \
    libxshmfence1 \
  && rm -rf /var/lib/apt/lists/*

# ─── Python packages (changes rarely) ───
RUN pip3 install --break-system-packages --no-cache-dir \
    openai \
    python-dotenv \
    requests

# ─── Global npm tools (changes rarely) ───
RUN npm install -g \
    mcporter \
    mcp-chrome-bridger \
    agent-browser

# ─── Playwright Chromium (changes rarely, large layer) ───
RUN npx playwright install chromium \
  && npx playwright install-deps chromium

# ─── agent-browser setup (changes rarely) ───
RUN agent-browser install \
  && agent-browser install --with-deps

# ─── Entrypoint script (changes occasionally) ───
COPY entrypoint.sh /usr/local/bin/openclaw-sandbox-browser
RUN chmod 755 /usr/local/bin/openclaw-sandbox-browser

# ─── API keys (changes most often, last to preserve cache) ───
ARG TAVILY_API_KEY
ARG OPENAI_API_KEY
ENV TAVILY_API_KEY=${TAVILY_API_KEY}
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

USER sandbox
WORKDIR /home/sandbox

EXPOSE 9222 5900 6080

CMD ["openclaw-sandbox-browser"]
