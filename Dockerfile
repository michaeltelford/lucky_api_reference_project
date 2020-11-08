FROM crystallang/crystal:0.35.1-alpine

RUN apk add --quiet yaml pcre gc gcc

WORKDIR /app
COPY . .

RUN crystal build --release --static src/start_server.cr

FROM alpine:latest

WORKDIR /app
COPY --from=0 /app/start_server .

CMD ["./start_server"]
