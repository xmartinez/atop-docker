# Project makefile

.PHONY: build
build:
	docker build --tag=xmhidalgo/atop .

.PHONY: run
run:
	docker run --privileged --network=host --pid=host --uts=host --rm -it xmhidalgo/atop

.PHONY: publish
publish:
	echo docker push xmhidalgo/atop
