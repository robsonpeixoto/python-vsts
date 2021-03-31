FROM python:3.8.8

ENV POETRY_HOME=/opt/poetry/
ENV POETRY_VERSION=1.1.5
ENV TASK_VERSION=v3.3.0

RUN apt-get update && apt-get install -y \
  nodejs \
  sudo \
  && rm -rf /var/lib/apt/lists/*
RUN curl --location -s https://taskfile.dev/install.sh | bash -s -- -d -b /usr/local/bin ${TASK_VERSION}
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python - --version ${POETRY_VERSION} \
 && ln -s /opt/poetry/bin/poetry /usr/local/bin/poetry