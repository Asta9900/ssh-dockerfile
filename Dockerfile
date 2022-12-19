FROM ubuntu:22.04
MAINTAINER KC-chakrabattula1@gmail.com
RUN apt update && \ 
    apt install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:test1234' |chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN mkdir /root/.ssh
RUn apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

