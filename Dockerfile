FROM alpine as src
ENV VERSION=v1.0.4
RUN wget https://github.com/openebs/mayastor-control-plane/releases/download/${VERSION}/kubectl-mayastor-x86_64-linux-musl.zip
RUN unzip kubectl-mayastor-x86_64-linux-musl.zip
RUN chmod a+x /kubectl-mayastor

FROM bitnami/kubectl:latest
COPY --from=src /kubectl-mayastor /bin/kubectl-mayastor
