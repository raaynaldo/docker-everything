# Name of the Docker image
IMAGE_NAME = my-first-laptop-setup-image

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the Docker container
run: build
	docker run -it --rm $(IMAGE_NAME)

# Clean up the Docker image
clean:
	docker rmi $(IMAGE_NAME)

.PHONY: build run clean