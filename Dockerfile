FROM debian:buster


LABEL name="lutim" \
      description="Lutim image for docker" \
      maintainer="dylan.dervaux@orange.com" \
      url="https://gitlab.forge.orange-labs.fr/vpwz0513/lutim-fork"

RUN useradd -ms /bin/bash drawio
WORKDIR /home/drawio

RUN apt update
# Install dependencies for draw io
RUN apt install -y libgtk-3-0 libnotify4 libnss3 libxss1 xdg-utils libappindicator3-1 libsecret-1-0 xvfb libasound2

# Get draw io binary
RUN apt install -y wget
RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v12.6.5/draw.io-amd64-12.6.5.deb

# Install draw io
RUN dpkg -i draw.io-amd64-12.6.5.deb
RUN rm draw.io-amd64-12.6.5.deb

USER drawio

CMD [ "/bin/bash" ]

