FROM node:18-bullseye

# Install dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    xvfb \
    chromium \
    libgtk-3-0 \
    libx11-xcb1 \
    libnss3 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxi6 \
    libxtst6 \
    libasound2 \
    libpangocairo-1.0-0 \
    libxrandr2 \
    libgbm1 \
    wget \
    curl && \
    npm install -g playwright dotenv && \
    playwright install chromium

WORKDIR /app
COPY . .
RUN chmod +x start.sh entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
