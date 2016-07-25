FROM phoenix-builder
MAINTAINER Pierre Salmon <pierre.salmon@smartcontext.fr>

# Ready to go
ONBUILD ADD src/ /src/build
ONBUILD RUN cd /src/build && /scripts/build.sh
  
