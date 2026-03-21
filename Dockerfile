# Folosim ultima versiune LTS Node + Alpine
FROM node:24-alpine

WORKDIR /app

# Copiem package.json și package-lock.json pentru a instala dependențele
COPY app/package*.json ./

RUN npm install

# Copiem restul aplicației
COPY app .

EXPOSE 3000

CMD ["node", "index.js"]
