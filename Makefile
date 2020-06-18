VAPOR=vapor-beta

ifndef VERSION
	export VERSION=$(shell git rev-parse HEAD)
	WARN_VERSION=true
endif

version:
ifeq ($(WARN_VERSION), true)
	$(info No VERSION provided, defaulting to $(VERSION))
else
	$(info VERSION: $(VERSION))
endif

build:
	$(VAPOR) build

run:
	$(VAPOR) run

test:
	swift test --enable-test-discovery --enable-code-coverage
