FROM ddway2/phoenix

ENV USER_ID     ##USER_ID##

RUN groupadd -g $USER_ID phoenix && \
    adduser --quiet --uid $USER_ID --gid $USER_ID --disabled-password --gecos "" phoenix && echo "phoenix:phoenix" | chpasswd

RUN apt-get install -y \
    gdb 

USER phoenix
VOLUME ["/src/app"]
WORKDIR /src/app

CMD ["bash"]
