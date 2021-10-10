FROM jenkins/jenkins:lts
ARG DOCKER_GID=1000
USER root
COPY scripts/install_docker.sh /install_docker.sh
RUN chmod +x /install_docker.sh && \
    /install_docker.sh && \
    /usr/sbin/groupadd -g ${DOCKER_GID:-1000} -f docker && \
    /usr/sbin/usermod -aG docker jenkins

USER jenkins