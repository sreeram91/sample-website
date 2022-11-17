FROM node:16-alpine AS main
WORKDIR /app
COPY package.json .
RUN npm install
COPY . . 
CMD ["npm", "start"]

FROM nginx
EXPOSE 80
COPY --from=main /app/build /usr/share/nginx/html
