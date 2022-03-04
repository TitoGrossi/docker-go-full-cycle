FROM golang:1.17-alpine as builder

WORKDIR /app

COPY . .

RUN go mod init github.com/TitoGrossi/hello-world-go
RUN go mod tidy

RUN go build -o ./app

FROM scratch

WORKDIR /app

COPY --from=builder /app/app .

ENTRYPOINT [ "./app" ]