FROM node:18-alpine

# Install OS packages required by Chromium
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    yarn \
    udev \
    dumb-init

# Puppeteer will look for Chromium here
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Set working directory
WORKDIR /app

# Install dependencies
#COPY package.json yarn.lock ./
# Copy the rest of the code
COPY . .
RUN yarn install --frozen-lockfile

# Expose the port your app uses
EXPOSE 8080

# Use dumb-init to forward signals (Ctrl+C, etc.)
ENTRYPOINT ["dumb-init", "--"]

# Start the app
CMD ["yarn", "start"]
