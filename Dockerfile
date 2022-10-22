FROM nginx AS origen
COPY dist /usr/share/nginx/html

FROM alpine
COPY --from=builder /

