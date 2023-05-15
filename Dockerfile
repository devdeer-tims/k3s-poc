ARG VARIANT="latest"
FROM debian:${VARIANT} as debian-latest

ARG ROOT_PASSWORD="root"
RUN echo "root:${ROOT_PASSWORD}" | chpasswd

RUN apt-get update \
    && apt-get install --no-install-recommends curl -y \
    && apt-get autoremove -y && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sfL https://get.k3s.io | sh -

CMD ["/usr/sbin/sshd", "-D"]