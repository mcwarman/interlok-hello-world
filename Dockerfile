FROM adaptris/interlok:latest-alpine

RUN rm -rf /opt/interlok/webapps/*.war

COPY config /opt/interlok/config
COPY lib /opt/interlok/lib

CMD [""]
