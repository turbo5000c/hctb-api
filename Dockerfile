FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install dependencies
#COPY package.json yarn.lock ./
# Copy the rest of the code
COPY . .
RUN yarn install --frozen-lockfile

# Expose the port your app uses
EXPOSE 8080

# Start the app
CMD ["yarn", "start"]
