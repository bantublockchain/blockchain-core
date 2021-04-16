FROM ubuntu:focal
RUN apt-get update
RUN apt-get install -y wget software-properties-common gnupg
RUN apt-get install -y curl git libpq-dev libsqlite3-dev libsasl2-dev vim zlib1g-dev  \
	jq netcat # Parsing stellar-core JSON for standalone network and checking core HTTP server
RUN apt install -y python3-pip
RUN pip3 install --upgrade b2
RUN touch /sbin/b2_
RUN echo "#!/bin/bash" >> /sbin/b2_
RUN echo "b2 authorize-account" >> /sbin/b2_
RUN echo "b2 \$@" >> /sbin/b2_
RUN chmod uga+x /sbin/b2_
RUN apt-get clean
COPY src/stellar-core /sbin/blockchain-core
RUN chmod u+x /sbin/blockchain-core

ENTRYPOINT ["/sbin/blockchain-core", "--conf", "/blockchain-core.cfg"]