FROM node AS original
WORKDIR /app
COPY dist /usr/share/nginx/html
RUN npm install
COPY . .
RUN npm run build

FROM nginx  
COPY --from=original /app/build /usr/share/nginx/html
