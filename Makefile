.PHONY: dockerx
dockerx:
ifneq ($(ver),)
	# Ensure 'docker buildx ls' shows correct platforms.
	docker buildx build \
		--tag natsio/nats-box:$(ver) --tag natsio/nats-box:latest \
		--platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64/v8 \
		--push .
else
	# Missing version, try this.
	# make dockerx ver=1.2.3
	exit 1
endif
