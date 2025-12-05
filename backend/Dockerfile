FROM node:18-alpine

WORKDIR /app

# Install build dependencies for native modules
RUN apk add --no-cache python3 make g++ gcc curl

COPY package*.json ./

# Try to install and build, but don't fail if better-sqlite3 has issues in demo mode
RUN npm install 2>&1 || npm install --ignore-scripts

COPY . .

EXPOSE 3001

ENV NODE_ENV=production
ENV DEMO_MODE=true

# Add health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3001/api/health || exit 1

CMD ["npm", "start"]
