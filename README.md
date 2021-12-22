# supply-chain-example

GoReleaser + Cosign keyless signing + Syft SBOM generation example.

## Verifying

```shell
wget https://github.com/goreleaser/supply-chain-example/releases/download/v1.0.0/checksums.txt
wget https://github.com/goreleaser/supply-chain-example/releases/download/v1.0.0/checksums.txt.sig
wget https://github.com/goreleaser/supply-chain-example/releases/download/v1.0.0/checksums.pem
COSIGN_EXPERIMENTAL=1 cosign verify-blob --cert checksums.pem --signature checksums.txt.sig checksums.txt
COSIGN_EXPERIMENTAL=1 cosign verify ghcr.io/goreleaser/supply-chain-example:v1.0.0
```
