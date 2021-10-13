FROM golang:1.9-alpine as builder

EXPOSE 8081

WORKDIR /go/src/app
RUN apk --no-cache add curl git && \
    curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

COPY ./src .
RUN dep ensure

RUN go build -o auth-api

FROM golang:1.9-alpine

WORKDIR /app

COPY --from=builder /go/src/app/auth-api .

ENTRYPOINT [ "./auth-api" ]
