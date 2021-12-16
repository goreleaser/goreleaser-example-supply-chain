FROM scratch
COPY keyless /usr/local/bin/keyless
ENTRYPOINT [ "/usr/local/bin/keyless" ]
