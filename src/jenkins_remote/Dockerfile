FROM jenkins/jenkins:lts
ARG DOCKER_GID=1000
USER root

# docker install
COPY scripts/install_docker.sh /install_docker.sh
RUN chmod +x /install_docker.sh && \
    /install_docker.sh

# aws cli install
COPY scripts/install_aws.sh /install_aws.sh
RUN chmod +x /install_aws.sh && \
    /install_aws.sh

# set jenkins user to host docker group
RUN /usr/sbin/groupadd -g ${DOCKER_GID:-1000} -f docker && \
    /usr/sbin/usermod -aG docker jenkins

USER jenkins