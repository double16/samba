FROM alpine:3.4
MAINTAINER Patrick Double <pat@patdouble.com>

ARG BUILD_DATE
ARG SOURCE_COMMIT
ARG DOCKERFILE_PATH
ARG SOURCE_TYPE

ENV SAMBA_VERSION=4.4.5-r1

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="$DOCKERFILE_PATH/Dockerfile" \
      org.label-schema.license="AGPL-3.0" \
      org.label-schema.name="Samba ${SAMBA_VERSION} docker container" \
      org.label-schema.url="https://github.com/double16/samba" \
      org.label-schema.vcs-ref=$SOURCE_COMMIT \
      org.label-schema.vcs-type="$SOURCE_TYPE" \
      org.label-schema.vcs-url="https://github.com/double16/samba.git"

RUN apk add --no-cache samba=${SAMBA_VERSION} bash && \
    adduser -h /tmp -H -S smbuser && \
    rm -rf /tmp/*
COPY samba.sh /usr/bin/
COPY smb.conf /etc/samba

VOLUME ["/etc/samba"]

EXPOSE 137 139 445

ENTRYPOINT ["samba.sh"]

HEALTHCHECK CMD (nc -zv localhost 445 && nc -zv localhost 139) || exit 1
