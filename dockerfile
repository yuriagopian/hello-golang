# Build stage
FROM golang:1.14-alpine as builder

WORKDIR /src
COPY hello.go .

RUN go build -o /app/hello -v ./hello.go

# Final stage
FROM alpine:3.12

WORKDIR /app
COPY --from=builder /app .

CMD [ "./hello" ]