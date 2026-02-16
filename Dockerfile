FROM alpine

RUN apk add --no-cache jq


RUN arch=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/amd64/) && \
    wget https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.33.0/crictl-v1.33.0-linux-${arch}.tar.gz && \
    tar xzf crictl-v1.33.0-linux-${arch}.tar.gz && \
    mv crictl /usr/bin && \
    rm crictl-v1.33.0-linux-${arch}.tar.gz
