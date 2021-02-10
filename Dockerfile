FROM ubuntu:18.04

COPY assets /assets
RUN /assets/setup.sh

COPY sample /sample

EXPOSE 22
EXPOSE 1521
EXPOSE 8080

CMD /usr/sbin/startup.sh && tail -f /dev/null
