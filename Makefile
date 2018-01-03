# Build
build:
	docker build --tag alexgleith/cdo .

shell:
	docker run --rm -it -v /tmp:/tmp alexgleith/cdo bash