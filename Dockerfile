# ==========================
# Build Stage
# ==========================
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

RUN mkdir -p /app/ready-to-serve && \
    FINAL_DIR=$(find /app/dist -name "index.html" -exec dirname {} \; | head -n 1) && \
    cp -r $FINAL_DIR/* /app/ready-to-serve/

# ==========================
# Runtime Stage
# ==========================
FROM nginx:alpine

COPY --from=build /app/ready-to-serve /usr/share/nginx/html

# Reemplazo dinámico del puerto
RUN sed -i 's/listen.*80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]