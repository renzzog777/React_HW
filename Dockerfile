FROM node:16 AS origin
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD [ "node", "App.jsx" ]

FROM nginx
COPY --from=origin /usr/src/app /usr/share/nginx/html
