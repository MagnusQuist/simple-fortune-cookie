FROM golang:1.20.0

WORKDIR /app

COPY . /app

RUN go build -o frontend

CMD ["./frontend"]
