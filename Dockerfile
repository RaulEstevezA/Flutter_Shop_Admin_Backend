FROM node:19.2.0

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --omit=dev

COPY backend/dist ./dist
COPY backend/static ./static

EXPOSE 3000

CMD ["node", "dist/main.js"]