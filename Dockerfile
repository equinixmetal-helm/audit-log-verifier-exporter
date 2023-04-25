FROM golang:1.20 as builder

WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
RUN CGO_ENABLED=0 go install github.com/adhocteam/script_exporter@v1.2.0

FROM ubuntu:22.04

COPY --from=builder /go/bin/script_exporter /usr/app/script_exporter
COPY script-exporter.yml /usr/app/script_exporter.yml

ENTRYPOINT [ "/usr/app/script_exporter" ]
