FROM node:alpine as builder
ENV NODE_VERSION 8.15.1
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build 

FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html