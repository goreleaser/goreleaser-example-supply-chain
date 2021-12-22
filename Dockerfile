FROM scratch
COPY supply-chain-example /usr/local/bin/supply-chain-example
ENTRYPOINT [ "/usr/local/bin/supply-chain-example" ]
