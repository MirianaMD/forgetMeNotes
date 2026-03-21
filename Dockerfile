# Ultima versiune stabilă Node 24 + Alpine 3.25+
FROM node:24-alpine3.25

# Director de lucru
WORKDIR /app

# Actualizare Alpine și pachete de bază
RUN apk update && apk upgrade && apk add --no-cache bash git

# Copiem doar package.json + package-lock.json
COPY app/package*.json ./

# Instalare dependențe
RUN npm install --omit=dev

# Copiem restul aplicației
COPY app . 

# Expunem portul aplicației
EXPOSE 3000

# Pornim aplicația
CMD ["node", "index.js"]