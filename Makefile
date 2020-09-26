# Project makefile

REGISTRY := xmhidalgo/atop
VERSION := 2.5.0-1

.PHONY: build
build:
	docker build --tag=$(REGISTRY):latest --tag=$(REGISTRY):$(VERSION) .

.PHONY: run
run:
	docker run --privileged --network=host --pid=host --uts=host --rm -it $(REGISTRY):$(VERSION)

.PHONY: publish
publish:
	docker push $(REGISTRY):latest
	docker push $(REGISTRY):$(VERSION)
