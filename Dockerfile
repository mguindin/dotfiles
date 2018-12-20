FROM ubuntu:18.04

LABEL maintainer="Matt Guindin <m@guind.in>"
LABEL updated_at=2018-12-20

# Get ubuntu up to date and installed
RUN apt-get update && apt-get -qq upgrade \
  && apt-get -qq install make apt-utils\
  && sh -c "echo 'LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8' >> /etc/environment"

# setup user
COPY . /root/dotfiles

WORKDIR /root/dotfiles

# submodule, stow, etc
RUN make
RUN ln -s /usr/bin/python3 /usr/local/bin/python3
RUN pip install --upgrade pip \
    && python3 -m ensurepip \
    && pip install neovim

RUN cd /root/ \
    && fish \
    && /root/.asdf/bin/asdf plugin-add golang \
    && /root/.asdf/bin/asdf install
WORKDIR /root
CMD ["fish"]
