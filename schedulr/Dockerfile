FROM debian:latest
# Optional things you can uncomment this and fill in your own info
LABEL maintainer="Abe Valle <me@abevalle.com>"
LABEL name="Schedulr Application"
LABEL version="latest"

ARG GIT_NAME
ARG GIT_EMAIL

# Upate all packages
RUN apt-get update -y

# Install necessary packages
RUN apt-get install git curl wget -y

# Preparing for git clone
RUN cd /opt
RUN echo "${SSH_PRIVATE_KEY}"
RUN mkdir /root/.ssh
COPY id_rsa /root/.ssh/id_rsa
COPY id_rsa.pub /root/.ssh/id_rsa.pub
RUN cat /root/.ssh/id_rsa \
    && chmod 700 -R /root/.ssh/id_rsa \
    && chown root:root /root/.ssh/id_rsa

# Create known_hosts
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

#Clone Repo
RUN git clone git@github.com:abevalle/schedulr-bridge.git
RUN cd schedulr-bridge \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash \
    && . /root/.nvm/nvm.sh \
    && nvm install node \
    && npm install

# Install Node and NVM
#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash \
#    && . /root/.nvm/nvm.sh \
#    && nvm install node \
#    && npm install


CMD ["bash"]
WORKDIR /opt/schedulr-bridge/