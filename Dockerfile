FROM node:24-slim

WORKDIR /app

COPY app/package*.json ./
RUN npm install --omit=dev

COPY app .
EXPOSE 3000

CMD ["node", "index.js"]