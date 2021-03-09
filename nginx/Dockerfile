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
RUN apt-get install nginx



CMD ["bash"]
WORKDIR /etc/nginx/