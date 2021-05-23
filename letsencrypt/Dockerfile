FROM debian:latest
# Optional things you can uncomment this and fill in your own info 
LABEL maintainer="Abe Valle <me@abevalle.com>"
LABEL name="Certbot"
LABEL version="latest"

ARG user=dev
ENV user=$user
# Add user with zsh as default shell
RUN useradd -ms /bin/bash $user

# Update and upgrade apt sources and applications
RUN apt-get update -y \
    # Install sudo
    && apt-get install sudo -y 

# Make sudo passwordless
RUN echo "${user} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user

# Changer user
USER $user

# Install git wget ne zsh
RUN sudo apt-get install git wget ne -y

RUN sudo apt install snapd -y

CMD ["bash"]

RUN sudo apt install certbot python-certbot-nginx -y

# Set working dir
WORKDIR /opt/