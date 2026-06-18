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

# El uso de * permite copiar el contenido sin importar si la ruta es /dist, /dist/browser o /dist/tu-app/browser
COPY --from=build /app/dist/*/browser /usr/share/nginx/html/ 2>/dev/null || \
    COPY --from=build /app/dist/* /usr/share/nginx/html/ 2>/dev/null || \
    COPY --from=build /app/dist /usr/share/nginx/html/

# Reemplazo dinámico del puerto 80 al 8080 en la configuración de Nginx
RUN sed -i 's/listen.*80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]