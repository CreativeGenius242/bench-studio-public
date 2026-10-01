FROM node:24-bookworm-slim

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --include=dev

COPY . .

ENV NODE_ENV=production
ENV BENCH_API_PORT=8787
ENV BENCH_WEB_PORT=5200
ENV BENCH_DATA_DIR=/app/data

EXPOSE 5200

CMD ["npm", "run", "dev"]
