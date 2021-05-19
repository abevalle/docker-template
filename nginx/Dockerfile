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
RUN sudo apt-get install nginx -y
# Install Certbot Certbot nginx and curl
RUN sudo apt-get install certbot python-certbot-nginx curl -y
# Install Custom Nginx Utils
RUN sudo curl -o- https://github.com/abevalle/nginx-utils/raw/master/install.sh | bash


CMD ["bash"]
WORKDIR /etc/nginx/