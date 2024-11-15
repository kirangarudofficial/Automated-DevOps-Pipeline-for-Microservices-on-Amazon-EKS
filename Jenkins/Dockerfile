# Use the official Node.js image
FROM node:14

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json for dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application source code into the container
COPY . .

# Expose the application port (replace 3000 with your app's port)
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
