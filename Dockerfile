FROM node:24-bookworm-slim

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --include=dev

COPY . .

RUN npm run build

ENV NODE_ENV=production
ENV BENCH_DATA_DIR=/app/data

EXPOSE 5200

CMD ["node", "server/server.mjs"]
