FROM centos:centos7

MAINTAINER Tomohisa Kusano <siomiz@gmail.com>

COPY copyables /
RUN chmod +x /entrypoint.sh /gencert.sh

RUN bash /build.sh \
    && rm /build.sh

WORKDIR /opt

VOLUME /opt

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 500/udp 4500/udp 1701/tcp 1194/udp 5555/tcp

CMD ["/usr/local/sbin/run"]
