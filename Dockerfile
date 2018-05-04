FROM nvidia/cuda:9.1-cudnn7-devel-centos7
ADD /helloWorld /usr/bin/
RUN yum -y update; yum clean all
RUN yum -y install make
RUN yum -y install emacs
RUN yum -y install sudo
RUN echo "nimbix ALL=(ALL:ALL) ALL" >> /etc/sudoers
RUN yum -y groupinstall "Development Tools"
RUN yum -y install openssh-server; yum clean all
ENTRYPOINT ["/usr/sbin/sshd","-D"]

# test
# test3
