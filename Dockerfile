# Use an official node image as the base image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies including Medusa
RUN npm install -g @medusajs/medusa-cli && npm install

# Copy the rest of the application code
COPY . .

# Expose the port that Medusa will run on
EXPOSE 9000

# Start the Medusa server
CMD ["medusa", "develop"]
