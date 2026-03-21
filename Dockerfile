# Ultima versiune Node 24 + Alpine recentă (3.25+)
FROM node:24-alpine

WORKDIR /app

# Copiem package.json + package-lock.json pentru a instala dependențele
COPY app/package*.json ./

# Instalare dependențe
RUN npm install

# Copiem restul aplicației
COPY app .

EXPOSE 3000

CMD ["node", "index.js"]
