FROM debian:latest
# Optional things you can uncomment this and fill in your own info
#LABEL maintainer="Fist Last <email@example.com>"
#LABEL name="<App name>"
#LABEL version="<version>"

ARG USER=$USER

# Add user with zsh as default shell
RUN useradd -ms /bin/bash ${USER}

# Update and upgrade apt sources and applications
RUN apt-get update -y \
    # Install sudo
    apt-get install sudo -y 

# Make sudo passwordless
RUN echo ${USER} "ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user

# Changer user
USER ${USER}

# Install git wget ne zsh
RUN sudo apt-get install git wget ne zsh -y

# Install Oh My ZSH
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install nvm
ENV NVM_DIR /home/${USER}/.nvm
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | zsh 
    # Install node and npm via NVM
RUN . $NVM_DIR/nvm.sh \
    && nvm install node

CMD ["zsh"]
# Set working dir
WORKDIR /opt/inventory-bridge