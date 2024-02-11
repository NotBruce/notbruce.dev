# Use the official Node.js 18 image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

RUN npm config set legacy-peer-deps true

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Next.js website
RUN npm run build

# Expose the port on which the application will run
EXPOSE 3555

# Start the application
CMD ["npm", "start", '-p', '3555']
