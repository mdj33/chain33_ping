FROM ubuntu:16.04


RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
  && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y sudo net-tools iputils-ping


WORKDIR /root
COPY chain33 chain33
COPY chain33-cli chain33-cli
COPY chain33.toml ./

CMD ["/root/chain33", "-f", "/root/chain33.toml"]
