FROM node:22-alpine AS build

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

# Add build arguments for API URL and API key
ARG VUE_APP_API_URL
ARG VUE_APP_API_KEY
ENV VUE_APP_API_URL=${VUE_APP_API_URL}
ENV VUE_APP_API_KEY=${VUE_APP_API_KEY}

WORKDIR /app

COPY package*.json ./
RUN npm ci --include=dev

COPY . .

RUN npm run build

FROM nginx:1.27-alpine AS runtime

COPY --from=build /app/dist /usr/share/nginx/html
COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
    CMD wget -q0- http://localhost/ >/dev/null 2>&1 || exit 1

CMD ["nginx", "-g", "daemon off;"]
