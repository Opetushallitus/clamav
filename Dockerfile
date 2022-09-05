FROM amazoncorretto:11-alpine

RUN apk add nss

COPY files/run.sh /usr/local/bin/run
COPY files/clamav-rest-1.0.3.jar /usr/local/bin/clamav-rest.jar

WORKDIR /root/
COPY *.sh ./
RUN \
  sh install.sh && \
  sh test.sh && \
  rm install.sh && \
  rm test.sh

ENV NAME clamav
RUN addgroup -S oph -g 1001 && adduser -u 1001 -S -G oph oph
WORKDIR /home/oph
USER oph

CMD ["sh", "/usr/local/bin/run"]
