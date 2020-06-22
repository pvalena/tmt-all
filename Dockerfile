ARG FROM
FROM fedora:${FROM}

RUN set -x && \
  dnf install -y --setopt=tsflags=nodocs \
    tmt-all beakerlib && \
  dnf clean all --enablerepo='*' && \
  useradd -u 1001 test && \
  echo 'test ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER 1001
ENV HOME /home/test

COPY .fmf $HOME/run/
COPY plans $HOME/run/

WORKDIR $HOME/run

#RUN tmt init && tmt run | grep -E '^total: 4 tests passed$'
CMD tmt run -v
