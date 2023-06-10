LAST_COMMIT_HASH := $(shell git rev-parse HEAD)
BRANCH_NAME := $(shell git branch --show-current)
BUILD_AT := $(shell date -u)

run-local-docker-server:
	docker build --build-arg LAST_COMMIT_HASH=$(LAST_COMMIT_HASH) --build-arg BRANCH_NAME=$(BRANCH_NAME) --build-arg BUILD_AT="$(BUILD_AT)" -t budget_app . && docker-compose up

build:
	docker build --build-arg LAST_COMMIT_HASH=$(LAST_COMMIT_HASH) --build-arg BRANCH_NAME=$(BRANCH_NAME) --build-arg BUILD_AT="$(BUILD_AT)" -t budget_app .
