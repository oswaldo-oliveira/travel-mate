FROM golang:1.22.5-alpine

WORKDIR /travel-mate

COPY go.mod go.sum ./

RUN go mod download && go mod verify

COPY . .

WORKDIR /travel-mate/cmd/travel-mate

RUN go build -o /travel-mate/bin/travel-mate .

EXPOSE 8080
ENTRYPOINT [ "/travel-mate/bin/travel-mate" ]
