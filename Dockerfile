# ---- Build Stage ----
FROM node:22-alpine AS builder
WORKDIR /app
COPY project/package.json project/package-lock.json ./
RUN npm install --omit=optional --silent

# ---- Runtime Stage ----
FROM node:22-alpine
WORKDIR /app

# Health check
RUN apk add --no-cache tini curl

COPY --from=builder /app/node_modules ./node_modules
COPY project/ ./

# Create data directories
RUN mkdir -p /app/memories /app/data /app/Config /app/tmp-backups /app/restore-snapshots

ENV PORT=3847
ENV NODE_ENV=production

EXPOSE 3847

HEALTHCHECK --interval=30s --timeout=10s --start-period=15s --retries=3 \
  CMD curl -f http://localhost:${PORT}/ || exit 1

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["node", "server/server.js"]
