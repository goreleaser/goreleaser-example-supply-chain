# supply-chain-example

GoReleaser + Go Mod proxying + Cosign keyless signing + Syft SBOM generation example.

## How it works

GoReleaser manages the entire thing, basically.

It will:

- build using the Go Mod Proxy as source of truth
- call `syft` to create the SBOMs
- create the checksum file
- sign it with `cosign`
- create a docker image using the binary it just built (thus, the binary inside the docker image is the same as the one released)
- sign the docker image with `cosign` as well

## Verifying

### Checksums

```shell
wget https://github.com/goreleaser/supply-chain-example/releases/download/v1.3.1/checksums.txt
cosign verify-blob \
  --certificate-identity 'https://github.com/goreleaser/goreleaser-example-supply-chain/.github/workflows/release.yml@refs/tags/v1.3.1' \
  --certificate-oidc-issuer 'https://token.actions.githubusercontent.com' \
  --cert https://github.com/goreleaser/supply-chain-example/releases/download/v1.3.1/checksums.txt.pem \
  --signature https://github.com/goreleaser/supply-chain-example/releases/download/v1.3.1/checksums.txt.sig \
  ./checksums.txt
```

You can then download any file you want from the release, and verify it with, for example:

```shell
wget https://github.com/goreleaser/supply-chain-example/releases/download/v1.3.1/supply-chain-example_1.3.1_linux_amd64.tar.gz.sbom
wget https://github.com/goreleaser/supply-chain-example/releases/download/v1.3.1/supply-chain-example_1.3.1_linux_amd64.tar.gz
sha256sum --ignore-missing -c checksums.txt
```

And both should say "OK".

You can then inspect the `.sbom` file to see the entire dependency tree of the binary.

### Docker image

```shell
COSIGN_EXPERIMENTAL=1 cosign verify ghcr.io/goreleaser/supply-chain-example:v1.2.0
```
