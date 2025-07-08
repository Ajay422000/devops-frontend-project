# Step 1: Build stage (optional here)
FROM node:18-alpine AS builder

WORKDIR /app
COPY . .

# Step 2: Final stage — serving app
FROM node:18-alpine

# Install http-server here in final image
RUN npm install -g http-server

WORKDIR /app
COPY . .

EXPOSE 8080
CMD ["http-server", "src", "-p", "8080"]
