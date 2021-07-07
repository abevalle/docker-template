FROM debian:latest
# Optional things you can uncomment this and fill in your own info 
LABEL maintainer="Abe Valle <me@abevalle.com>"
LABEL name="Base Dev environment"
LABEL version="latest"



# Upate all packages
RUN apt-get update -y
# Add user nginx
RUN useradd -ms /bin/bash nginx
# Install sudo
RUN apt-get install sudo -y
# Make nginx sudoer with no password flag
RUN echo "nginx ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user
# Change user to nginx
USER nginx
# Install nginx
RUN sudo apt-get install apt-utils ne zsh -y
RUN sudo apt-get install git curl wget -y
RUN sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN sudo apt-get install nginx -y
RUN cd /var/www/ && sudo git clone https://github.com/abevalle/valleus-http-error-pages.git && cd valleus-http-error-pages && sudo mv globalError /etc/nginx
RUN curl -o- https://github.com/abevalle/nginx-utils/raw/master/dist/nginx-utils | bash

CMD ["bash"]
WORKDIR /etc/nginx/
