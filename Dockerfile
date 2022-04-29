FROM nvidia/cuda:11.6.0-base-ubuntu20.04

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility

RUN mkdir -p /usr/local/bin /patched-lib
COPY patch.sh docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/patch.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
