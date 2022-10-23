FROM nginx AS original
WORKDIR /app
COPY dist /usr/share/nginx/html

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /app ./
