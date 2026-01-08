FROM golang:1.23-alpine AS builder
WORKDIR /app

COPY . .

RUN go build main.go -o hello

FROM alpine:latest
WORKDIR /root/

COPY --from=builder /app/hello .

CMD ["./hello"]