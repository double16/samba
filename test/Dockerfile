FROM alpine:3.6
MAINTAINER Patrick Double <pat@patdouble.com>

RUN apk add --no-cache samba bash && \
    rm -rf /tmp/*

COPY *.sh ./
CMD ["./test.sh"]

