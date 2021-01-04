FROM golang as builder
WORKDIR /hello-world
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /bin/hello-world .

FROM alpine
WORKDIR /app
EXPOSE 8080
ENTRYPOINT ["/app/hello-world"]
COPY --from=builder /bin/hello-world /app
