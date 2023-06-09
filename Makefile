LAST_COMMIT_HASH := $(shell git rev-parse HEAD)
BRANCH_NAME := $(shell git branch --show-current)
BUILD_AT := $(shell date -u)

run-local-docker-server:
	docker build --build-arg LAST_COMMIT_HASH=$(LAST_COMMIT_HASH) --build-arg BRANCH_NAME=$(BRANCH_NAME) --build-arg BUILD_AT="$(BUILD_AT)" -t budget_app . && docker-compose up

build-image-on-ci:
	docker build --build-arg LAST_COMMIT_HASH=$(CI_COMMIT_SHORT_SHA) --build-arg BRANCH_NAME=$(CI_COMMIT_REF_NAME) --build-arg BUILD_AT="$(BUILD_AT)" -t budget_app:latest .

build:
	docker build --build-arg LAST_COMMIT_HASH=$(LAST_COMMIT_HASH) --build-arg BRANCH_NAME=$(BRANCH_NAME) --build-arg BUILD_AT="$(BUILD_AT)" -t budget_app .
