FROM scratch
COPY supply-chain-example /usr/bin/supply-chain-example
ENTRYPOINT [ "/usr/bin/supply-chain-example" ]
