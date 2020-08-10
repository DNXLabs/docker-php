VERSION = php-7.4-dnx-1.0.0
IMAGE_NAME ?= dnxsolutions/php:$(VERSION)
TAG = $(VERSION)

build:
	docker build -t $(IMAGE_NAME) .

shell:
	docker run --rm -it -v $(PWD):/opt/app $(IMAGE_NAME) bash

gitTag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)
