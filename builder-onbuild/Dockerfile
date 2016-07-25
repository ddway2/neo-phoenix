FROM ddway2/phoenix
MAINTAINER Pierre Salmon <pierre.salmon@smartcontext.fr>

# Ready to go
ONBUILD ADD app/ /src/app
ONBUILD RUN cd /src/app && /scripts/build.sh

EXPOSE 8080

CMD ["bash"]

