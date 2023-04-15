ARG BUILD_PLATFORM=x86_64
FROM --platform=linux/$BUILD_PLATFORM python:slim-bullseye as base

ARG BUILD_PLATFORM

LABEL org.opencontainers.image.authors="@kindasimple" \
      org.opencontainers.image.source="https://github.com/kindasimple/toolbox" \
      org.opencontainers.image.title="toolbox" \
      org.opencontainers.image.description="Project code quality checks and development tools"

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    wget \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir \
    black \
    flake8 \
    mypy \
    mysqlclient \
    pylint \
    pytest \
    tox

RUN wget --progress=dot:giga https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-${BUILD_PLATFORM} -O /usr/local/bin/hadolint && \
          chmod +x /usr/local/bin/hadolint

WORKDIR /src

COPY ./.config /root/.config

CMD ["hadolint", "Dockerfile"]