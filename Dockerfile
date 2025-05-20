FROM ghcr.io/paperless-ngx/paperless-ngx:2.16
LABEL authors="benkeil"
RUN apt-get update \
    && apt-get install -y build-essential libssl-dev cmake \
    && apt-get clean \
    && pip install zxing-cpp --no-binary zxing-cpp
