FROM golang:1.20 as builder

WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
RUN CGO_ENABLED=0 go install github.com/adhocteam/script_exporter@v1.2.0

FROM alpine:3.17.3
RUN apk add --no-cache bash

COPY --from=builder /go/bin/script_exporter /usr/app/script-exporter
COPY script-exporter.yml /usr/app/script-exporter.yml
RUN chmod 755 /usr/app/script-exporter 

ENTRYPOINT [ "/usr/app/script-exporter" ]
