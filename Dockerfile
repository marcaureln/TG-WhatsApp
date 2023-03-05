FROM node:alpine

RUN apk add --no-cache \
  chromium \
  nss \
  freetype \
  harfbuzz \
  ca-certificates \
  udev \
  ttf-freefont

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser \
  PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

WORKDIR /app

COPY . /app

RUN npm ci

CMD ["npm", "start"]
