FROM golang:1.22 as builder

WORKDIR /
COPY . .
RUN go build -o goapp main.go

FROM alpine:latest
COPY --from=builder /goapp /goapp

CMD ["/goapp"]