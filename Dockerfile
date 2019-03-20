FROM alpine:latest

RUN apk add nss

COPY files/run.sh /tmp/scripts/run
COPY files/clamav-rest-1.0.2.jar /root/clamav-rest.jar

WORKDIR /root/
COPY *.sh ./
RUN \
  sh install.sh && \
  sh test.sh && \
  rm install.sh && \
  rm test.sh

ENV NAME clamav

CMD ["sh", "/tmp/scripts/run"]
