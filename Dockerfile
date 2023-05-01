# Base image
FROM node:alpine

# Install Node.js and npm
RUN apk update && apk add nodejs npm

# Create app directory
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package.json ./

# Install app dependencies
RUN npm install

# Copy app source code to the container
COPY . .

# Expose port 3000 for the application
EXPOSE 8000

# Run the application when the container starts
CMD ["npm", "start"]