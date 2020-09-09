FROM debian:buster-slim
COPY src/stellar-core /sbin/blockchain-core
RUN chmod u+x /sbin/blockchain-core
ENTRYPOINT ["/sbin/blockchain-core"]