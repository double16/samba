FROM alpine:3.8

RUN apk add --no-cache samba bash shadow && \
    rm -rf /tmp/*

COPY *.sh ./
CMD ["./test.sh"]
LABEL maintainer="Patrick Double <pat@patdouble.com>"
