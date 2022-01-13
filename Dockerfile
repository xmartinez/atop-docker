######################################################################
FROM ubuntu:20.04 as base

COPY scripts/apt-install /usr/local/bin

######################################################################
FROM base as builder

RUN apt-install ca-certificates wget
RUN wget https://github.com/Atoptool/atop/archive/v2.5.0.tar.gz
RUN tar -xvzf v2.5.0.tar.gz

RUN apt-install gcc make libncurses-dev libtinfo-dev zlib1g-dev
RUN make -C atop-2.5.0 genericinstall BINPATH=/usr/local/bin

######################################################################
FROM base as atop

RUN apt-install libncurses6 libtinfo6 s6 snooze zlib1g
COPY --from=builder /usr/local/bin /usr/bin
COPY service /service
RUN install -d -m 755 /var/log/atop
ENTRYPOINT ["/usr/bin/atop"]
