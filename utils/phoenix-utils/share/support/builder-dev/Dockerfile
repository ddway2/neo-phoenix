FROM ddway2/phoenix

ENV USER_ID     ##USER_ID##
ENV USER_GID    ##USER_GID##

RUN groupadd -g $USER_GID phoenix && \
    adduser --quiet --uid $USER_ID --gid $USER_GID --disabled-password --gecos "" phoenix && echo "phoenix:phoenix" | chpasswd

RUN apt-get install -y \
    gdb 

USER phoenix
VOLUME ["/src/app"]
WORKDIR /src/app

CMD ["bash"]
