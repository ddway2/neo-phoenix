FROM ddway2/phoenix

ADD /scripts/start.sh /scripts/start.sh
RUN apt-get install -y \
    gdb \
    gosu

VOLUME ["/src/app"]
WORKDIR /src/app

ENTRYPOINT ["/scripts/start.sh"]

