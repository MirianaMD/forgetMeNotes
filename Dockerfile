# Ultima versiune stabilă Node 24 + Alpine generic
FROM node:24-alpine

WORKDIR /app

# Actualizare pachete Alpine
RUN apk update && apk upgrade --no-cache bash git

# Copiem package.json + package-lock.json
COPY app/package*.json ./

# Instalare dependențe
RUN npm install --omit=dev

# Copiem restul aplicației
COPY app . 

EXPOSE 3000

CMD ["node", "index.js"]