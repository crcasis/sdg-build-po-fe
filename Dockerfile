# ==========================
# Build Stage
# ==========================
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# ==========================
# Runtime Stage
# ==========================
FROM nginx:alpine

# Usamos la ruta exacta extraída de tu angular.json + la subcarpeta /browser
COPY --from=build /app/dist/technical-assessment/browser /usr/share/nginx/html

# Configuramos Nginx correctamente para Angular (evita pantallas en blanco y errores 404)
RUN echo 'server { \
    listen 8080; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html index.htm; \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]