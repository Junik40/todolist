FROM golang:1.23

WORKDIR /app

COPY go.mod go.sum tracker.db ./


RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /42 ./main.go ./parcel.go

CMD ["/42"]    