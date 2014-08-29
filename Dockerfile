FROM larsks/runit:fedora20
MAINTAINER Lars Kellogg-Stedman <lars@oddbit.com>

RUN yum -y update; yum clean all
RUN yum -y install openssh-server; yum clean all
RUN mkdir -p /var/run/sshd
ADD sshd_config /etc/ssh/sshd_config

ADD service /service
ADD sshd.sysinit /etc/runit/sysinit/sshd
RUN chmod 755 /etc/runit/sysinit/*

EXPOSE 22

