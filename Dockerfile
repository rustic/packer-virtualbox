FROM rustic/fedora29-minimal
MAINTAINER "Lee Myers" <ichilegend@gmail.com>
ENV container docker
USER root
RUN dnf -y install \
    wget \
    unzip \
    kernel-devel \
    gcc \
    kernel-headers \
    which \
    make && \
  dnf -y upgrade && \
  cd /etc/yum.repos.d/ && \
  wget https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo && \
  rpm --import https://www.virtualbox.org/download/oracle_vbox.asc && \
  dnf -y install VirtualBox-6.0 && \
  dnf clean all && \
  export PACKER_VERSION=1.3.4 && \
  wget --directory-prefix=/tmp https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
  unzip /tmp/packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin && \
  rm -rf /var/cache/yum/* && rm -rf /tmp/*
CMD ["/usr/local/bin/packer"]
