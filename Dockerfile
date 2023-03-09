FROM golang:1.20.2 as builder

WORKDIR /go/src/app

COPY main_rocks.go .

RUN go build -o . main_rocks.go

RUN rm -rf /go/src/app/main_rocks.go

#smaller image
FROM scratch

WORKDIR /src/app

COPY --from=builder /go/src/app  .

ENTRYPOINT ["./main_rocks"]

