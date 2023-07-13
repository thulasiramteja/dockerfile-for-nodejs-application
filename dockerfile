FROM node:14 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --production


FROM node:14-alpine
WORKDIR /app
COPY --from=builder /app .
COPY index.js .
EXPOSE 3000
CMD ["node", "index.js"]
