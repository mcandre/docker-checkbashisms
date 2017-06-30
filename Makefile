# See https://gist.github.com/mcandre/90e6de688ef30693ba1c756e8ca8ae82
ifeq ($(OS),Windows_NT)
	ifneq ($(env MINGW_PREFIX),/mingw64)
		SHELL=cmd
	endif

endif

CWD_ABSOLUTE := $(shell pwd)

ifeq ($(SHELL),cmd)
	CWD_ABSOLUTE := $(shell echo %cd%)
endif

IMAGE=mcandre/docker-checkbashisms

all: test

build: Dockerfile
	docker build -t $(IMAGE) .

test: build
	-docker run --rm -v $(CWD_ABSOLUTE):/src mcandre/docker-checkbashisms checkbashisms /src/lib/script.sh

clean-containers:
	-docker ps -a | grep -v IMAGE | awk '{ print $$1 }' | xargs docker rm -f

clean-images:
	-docker images | grep -v IMAGE | grep $(IMAGE) | awk '{ print $$3 }' | xargs docker rmi -f

clean-layers:
	-docker images | grep -v IMAGE | grep none | awk '{ print $$3 }' | xargs docker rmi -f

clean: clean-containers clean-images clean-layers

editorconfig:
	flcl . | xargs -n 100 editorconfig-cli check

dockerlint:
	$(shell npm bin)/dockerlint

lint: editorconfig dockerlint

publish:
	docker push $(IMAGE)
