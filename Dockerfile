# Folosim ultima versiune stabilă Alpine pentru Node 20
FROM node:20-alpine3.24

WORKDIR /app

COPY app/package*.json ./

RUN npm install

COPY app .

EXPOSE 3000

CMD ["node", "index.js"]
