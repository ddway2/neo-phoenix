FROM ddway2/phoenix

ENV USER_ID 	105
ENV USER_GID 	105

RUN RUN adduser --quiet --uid $USER_ID --gid $USER_GID --disabled-password --gecos "" phoenix && echo "phoenix:phoenix" | chpasswd

RUN apt-get install -y \
    gdb 

USER phoenix
VOLUME ["/src/app"]
WORKDIR /src/app

CMD ["bash"]

