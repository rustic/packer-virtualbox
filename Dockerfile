FROM rustic/centos
MAINTAINER "Lee Myers" <ichilegend@gmail.com>
ENV container docker
USER root
RUN yum -y install epel-release && \
  yum -y install dnf && \
  yum clean all && \
  dnf -y install \
    wget \
    unzip \
    kernel-devel \
    gcc \
    kernel-headers \
    which \
    make && \
  cd /etc/yum.repos.d/ && \
  wget http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo && \
  rpm --import https://www.virtualbox.org/download/oracle_vbox.asc && \
  dnf -y install VirtualBox-6.0 && \
  dnf clean all && \
  export PACKER_VERSION=1.3.4 && \
  wget --directory-prefix=/tmp https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
  unzip /tmp/packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin && \
  rm -rf /var/cache/yum/* && rm -rf /tmp/*
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
