# Base image
FROM node:20.0-alpine

# Working directory
WORKDIR /app

# Install git (required for npm install from Git URLs, if any)
RUN apk add --no-cache git

# Copy dependencies
COPY package*.json ./

# Install deps
RUN npm install

# Copy source
COPY . .

# Expose the port React runs on
EXPOSE 3000

# Run fetch.js before starting the dev server
CMD ["sh", "-c", "node fetch.js && npm start"]