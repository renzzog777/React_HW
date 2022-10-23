FROM nginx AS origin
COPY dist /usr/share/nginx/html

FROM nginx:1.23-alpine
WORKDIR /usr/share/nginx/html 
COPY --from=origin /usr/share/nginx/html/dist  .
