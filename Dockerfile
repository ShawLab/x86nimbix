FROM nvidia/cuda:9.1-cudnn7-devel-centos7
ADD /helloWorld /usr/bin/
RUN yum -y update; yum clean all
RUN yum -y install make
RUN yum -y install emacs
RUN yum -y install sudo zip unzip 
RUN yum -y install *gcc* *g++* compat-libstdc++* glibc-statc libstdc++-static
RUN yum -y reinstall gcc

RUN echo "nimbix ALL=(ALL:ALL) ALL" >> /etc/sudoers
RUN yum -y groupinstall "Development Tools"
RUN yum -y install openssh-server; yum clean all
ADD https://github.com/nimbix/image-common/archive/master.zip /tmp/nimbix.zip
WORKDIR /tmp

RUN unzip nimbix.zip && rm -f nimbix.zip
RUN /tmp/image-common-master/setup-nimbix.sh
RUN yum -y install module-init-tools xz vim openssh-server libmlx4 libmlx5 iptables infiniband-diags make gcc gcc-c++ glibc-devel curl libibverbs-devel libibverbs librdmacm librdmacm-devel librdmacm-utils libibmad-devel libibmad byacc flex git cmake screen grep && yum clean all

RUN mkdir -p /usr/lib/JARVICE && cp -a /tmp/image-common-master/tools /usr/lib/JARVICE
RUN cp -a /tmp/image-common-master/etc /etc/JARVICE && chmod 755 /etc/JARVICE && rm -rf /tmp/image-common-master

ENTRYPOINT ["/usr/sbin/sshd","-D"]

# test
# test3
