FROM ddway2/phoenix
MAINTAINER Pierre Salmon <pierre.salmon@smartcontext.fr>

# Ready to go
ONBUILD ADD sources/ /src/sources
ONBUILD ADD cbuild.conf /src/cbuild.conf
ONBUILD RUN cd /src && /scripts/build.sh

EXPOSE 8080

CMD ["bash"]

