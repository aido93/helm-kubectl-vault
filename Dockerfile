FROM alpine:3.10

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.name="helm-kubectl-vault" \
      org.label-schema.url="https://hub.docker.com/r/aido93/helm-kubectl-vault/" \
      org.label-schema.vcs-url="https://github.com/aido93/helm-kubectl-vault" \
      org.label-schema.build-date=$BUILD_DATE

# Note: Latest version of kubectl may be found at:
# https://github.com/kubernetes/kubernetes/releases
ENV KUBE_LATEST_VERSION="v1.15.0"
# Note: Latest version of helm may be found at:
# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="v2.14.2"
# Note: Latest version of helm may be found at:
# https://github.com/hashicorp/vault/releases
ENV VAULT_VERSION="1.3.2"

RUN apk add --no-cache ca-certificates bash git openssh curl \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && wget -q https://releases.hashicorp.com/vault/{VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip -O - | tar -xzO vault > /usr/local/bin/vault \
    && chmod +x /usr/local/bin/vault

WORKDIR /config

CMD bash
