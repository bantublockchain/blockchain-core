FROM debian:buster-slim
COPY src/stellar-core /sbin/blockchain-core
CMD ["/sbin/blockchain-core"]