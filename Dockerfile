FROM debian:stretch-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        tftpd-hpa

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

RUN echo -n "Starting " \
    && in.tftpd --version

CMD ["in.tftpd", "-L", "-4", "--user", "tftp", "-a", "0.0.0.0:69", "-s", "-B1468", "-v", "/srv/tftp"]
