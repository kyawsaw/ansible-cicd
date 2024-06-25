FROM node:20-alpine

LABEL maintainer="Kyaw Saw <kyawsaw.mm@gmail.com>"
LABEL description="Docker image for Next.js App"

#Set working directory
WORKDIR /app

#Copy package.json and package-lock.json
COPY package*.json ./ 

#Install dependencies
RUN npm install

#Copy application code excluded files in .dockerignore
COPY . .

#Build the Next.js App
RUN npm run build

#Expose port 3000
EXPOSE 3000

#Command to run the Next.js App
CMD ["npm", "start"]

#Build the Docker image
#docker build -t nextjs-app .
#docker run --rm -p 3000:3000 -d --name nextjs-app nextjs-app
