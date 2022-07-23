FROM docker.io/library/ubuntu:jammy

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends wget default-jdk;

RUN mkdir -p /app
WORKDIR /app
RUN wget https://courses.missouristate.edu/KenVollmar/mars/MARS_4_5_Aug2014/Mars4_5.jar

COPY bin/mars /usr/local/bin/mars
RUN chmod +x /usr/local/bin/mars

RUN useradd -m codewarrior
RUN set -ex; \
    mkdir -p /workspace; \
    chown -R codewarrior: /workspace;
WORKDIR /workspace
USER codewarrior
