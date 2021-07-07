FROM debian:latest
# Optional things you can uncomment this and fill in your own info 
LABEL maintainer="Abe Valle <me@abevalle.com>"
LABEL name="Base Dev environment"
LABEL version="latest"



# Upate all packages
RUN apt-get update -y
RUN apt get install git curl wget
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
RUN nvm install node
RUN cd /opt
RUN git clone git@github.com:abevalle/schedulr-bridge.git
RUN cd schedulr-bridge
RUN npm install

CMD ["bash"]
WORKDIR /opt/schedulr-bridge/