# ---- Build stage: render the Eleventy site to static files ----
FROM node:22-alpine AS build

WORKDIR /app

# Install dependencies first (better layer caching)
COPY package.json package-lock.json ./
RUN npm ci

# Copy the rest of the source and build the site into /app/_site
COPY . .
RUN npx @11ty/eleventy

# ---- Runtime stage: serve the static files with nginx ----
FROM nginx:1.27-alpine AS runtime

# Custom nginx config (gzip, caching, clean URLs)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Ship only the built site
COPY --from=build /app/_site /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD wget -q -O /dev/null http://localhost/ || exit 1
