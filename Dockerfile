#Docker image setting up Squid
FROM alpine:3.7

LABEL maintainer="Daeus" \
  description="Alpine with Squid Proxy Installed" \
  version="1.0"

ENV SQUID_CONF_DIR="/etc/squid" \
  SQUID_CACHE_DIR="/var/spool/squid" \
  SQUID_CRON_PATH="/var/spool/cron/root" \
  WORKDIR=/squid

WORKDIR ${WORKDIR}

RUN apk update \
  && apk add squid bash

# Use updated config file
COPY squid.conf $SQUID_CONF_DIR/squid.conf

COPY whitelist-sites.conf $SQUID_CONF_DIR/whitelist-sites.conf

COPY whitelist-ip.conf $SQUID_CONF_DIR/whitelist-ip.conf

COPY entrypoint.sh /squid/entrypoint.sh

RUN mkdir -p /var/spool/squid && chown squid:squid /var/spool/squid

EXPOSE 3128/tcp

ENTRYPOINT /squid/entrypoint.sh
