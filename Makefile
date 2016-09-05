all: image onbuild

force-build: force-image force-build

image: builder/Dockerfile 
	docker build -t ddway2/phoenix builder

onbuild: image builder-onbuild/Dockerfile
	docker build -t ddway2/phoenix-obuild builder-onbuild

force-image:
	docker build --no-cache -t ddway2/phoenix builder

force-onbuild: 
	docker build --no-cache -t ddway2/phoenix-onbuild builder-onbuild

