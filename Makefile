# Project makefile

REGISTRY := xmhidalgo/atop
VERSION := 2.5.0-2

DOCKER_RUN := docker run --privileged --network=host --pid=host --uts=host --rm -it

.PHONY: build
build:
	docker build --tag=$(REGISTRY):latest --tag=$(REGISTRY):$(VERSION) .

.PHONY: run
run:
	$(DOCKER_RUN) $(REGISTRY):$(VERSION)

.PHONY: run-service
run-service:
	$(DOCKER_RUN) --entrypoint= $(REGISTRY):$(VERSION) /service/run

.PHONY: publish
publish:
	docker push $(REGISTRY):latest
	docker push $(REGISTRY):$(VERSION)
