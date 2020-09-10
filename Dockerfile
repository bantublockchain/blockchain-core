FROM ubuntu:focal
RUN apt-get update
RUN apt-get install -y wget software-properties-common gnupg
RUN apt-get install -y curl git libpq-dev libsqlite3-dev libsasl2-dev postgresql-client postgresql postgresql-contrib sudo vim zlib1g-dev supervisor \
	jq netcat # Parsing stellar-core JSON for standalone network and checking core HTTP server
RUN apt-get clean
COPY src/stellar-core /sbin/blockchain-core
RUN chmod u+x /sbin/blockchain-core

ENTRYPOINT ["/sbin/blockchain-core"]