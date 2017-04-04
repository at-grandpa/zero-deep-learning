REPOSITORY=deep
TAG=default

HOST_WORKDIR=$(PWD)
CONTAINER_WORKDIR=/root/deep

build:
	docker build --tag=$(REPOSITORY):$(TAG) .

attach:
	docker run -v $(HOST_WORKDIR):$(CONTAINER_WORKDIR) -it $(REPOSITORY):$(TAG)

jupyter:
	docker run -i -t -p 8888:8888 continuumio/anaconda3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser"
