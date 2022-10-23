FROM nginx AS original
WORKDIR /app
COPY dist /usr/share/nginx/html

FROM alpine:latest  
WORKDIR /root/
COPY --from=0 /app/original ./
