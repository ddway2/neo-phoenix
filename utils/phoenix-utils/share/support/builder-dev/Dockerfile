FROM ddway2/phoenix

ENV USER_ID     ##USER_ID##

RUN groupadd -g $USER_ID phoenix && \
    adduser --quiet --uid $USER_ID --gid $USER_ID --disabled-password --gecos "" phoenix && echo "phoenix:phoenix" | chpasswd && \
    echo "phoenix ALL=(root) NOPASSWD:ALL" | tee -a  /etc/sudoers.d/user && \
    chmod 0440 /etc/sudoers.d/user

RUN apt-get install -y \
    gdb 

USER phoenix
VOLUME ["/src"]
WORKDIR /src

CMD ["/bin/bash"]
