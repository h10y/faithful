FROM ghcr.io/openfaas/of-watchdog:0.10.1 AS watchdog

FROM alpine:3.20

RUN adduser -D app
USER app
WORKDIR /home/app
COPY app .

COPY --from=watchdog /fwatchdog .
ENV mode="static"
ENV static_path="/home/app"
HEALTHCHECK --interval=3s CMD [ -e /tmp/.lock ] || exit 1
CMD ["./fwatchdog"]
