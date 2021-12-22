# supply-chain-example

GoReleaser + Cosign keyless signing + Syft SBOM generation example.

## Verifying

### Checksums

```shell
wget https://github.com/goreleaser/supply-chain-example/releases/download/v1.0.0/checksums.txt
wget https://github.com/goreleaser/supply-chain-example/releases/download/v1.0.0/checksums.txt.sig
wget https://github.com/goreleaser/supply-chain-example/releases/download/v1.0.0/checksums.pem
cosign verify-blob --cert checksums.txt.pem --signature checksums.txt.sig checksums.txt
```

or simply

```shell
wget https://github.com/goreleaser/supply-chain-example/releases/download/v1.0.0/checksums.txt
wget https://github.com/goreleaser/supply-chain-example/releases/download/v1.0.0/checksums.txt.sig
COSIGN_EXPERIMENTAL=1 cosign verify-blob --signature checksums.txt.sig checksums.txt
```

### Docker image

```shell
COSIGN_EXPERIMENTAL=1 cosign verify ghcr.io/goreleaser/supply-chain-example:v1.0.0
```
