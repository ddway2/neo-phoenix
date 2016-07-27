FROM ddway2/phoenix

ENV USER_ID  105

RUN apt-get install -y \
    gdb

RUN useradd --shell /bin/bash -d /src/app -u $USER_ID -o -c "" -m user

VOLUME ["/src/app"]
VOLUME ["/var/cache/apt"]
WORKDIR /src/app



CMD /bin/bash

