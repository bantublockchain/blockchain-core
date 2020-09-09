FROM debian:buster-slim
apt-get update
apt-get install -y curl git libpq-dev libsqlite3-dev libsasl2-dev postgresql-client postgresql postgresql-contrib sudo vim zlib1g-dev supervisor \
	jq netcat # Parsing stellar-core JSON for standalone network and checking core HTTP server
apt-get clean
COPY src/stellar-core /sbin/blockchain-core
RUN chmod u+x /sbin/blockchain-core

ENTRYPOINT ["/sbin/blockchain-core"]