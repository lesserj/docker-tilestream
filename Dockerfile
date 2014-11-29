FROM 	centos:centos7

RUN     yum install -y epel-release && \
	yum group install -y "Development Tools" && \
	yum install -y nodejs npm git pip 

run 	pip install awscli 

RUN	git clone https://github.com/mapbox/tilestream.git && \
	cd tilestream && \
	npm install

WORKDIR	tilestream
ADD	config.json tilestream/ 

EXPOSE 	8888

CMD	aws s3 sync $MBTILES_S3_BUCKET && \
	node index.js start --config config.json

