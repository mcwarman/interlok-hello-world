FROM adaptris/interlok:latest-alpine

RUN rm -rf /opt/interlok/webapps/*.war
RUN rm -rf /opt/interlok/lib/*

ADD config /opt/interlok/config
ADD lib /opt/interlok/lib
ADD docker-entrypoint-wrapper.sh /docker-entrypoint-wrapper.sh

ENTRYPOINT ["/docker-entrypoint-wrapper.sh"]
CMD [""]
