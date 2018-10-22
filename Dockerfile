FROM ubuntu:16.04

LABEL maintainer="Matt Guindin <m@guind.in>"
LABEL updated_at=2017-12-07

RUN apt-get update && apt-get -qq upgrade \
  && apt-get -qq install software-properties-common \
  && apt-add-repository ppa:fish-shell/release-2 \
  && add-apt-repository ppa:jonathonf/vim \
  && sh -c "echo 'LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8' >> /etc/environment"

# Get ubuntu up to date and installed
RUN apt-get update && apt-get -qq install vim fish tmux mosh curl git stow python3 python-pip automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev
RUN apt-get -qq install gnupg2 gnupg-agent pinentry-curses scdaemon pcscd yubikey-personalization libusb-1.0-0-dev openssh-server netcat
RUN ln -s /usr/bin/python3 /usr/local/bin/python3
RUN pip install --upgrade pip \
    && pip install neovim

RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"

# Setup user
COPY . /root/dotfiles
RUN mkdir -p /root/.config/omf && mkdir -p /root/go/bin && mkdir -p /root/.cargo/bin

WORKDIR /root/dotfiles
RUN git submodule update --init

# ASDF installation
RUN git clone https://github.com/asdf-vm/asdf.git /root/.asdf --branch v0.4.0

# Un-stow dotfiles
RUN stow vim && stow nvim && stow tmux && stow zsh && stow asdf && stow omf && stow ssh && stow gnupg && stow base16-shell

RUN git clone https://github.com/oh-my-fish/oh-my-fish \
    && chmod 700 /root/.ssh \
    && chmod 600 /root/.ssh/config \
    && chmod 600 /root/.ssh/authorized_keys \
    && cd oh-my-fish \
    && bin/install --offline --noninteractive --yes

# ASDF plugin installation
# RUN cd /root/ \
#     && fish \
#     && /root/.asdf/bin/asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git \
#     && /root/.asdf/bin/asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git \
#     && bash /root/.asdf/plugins/nodejs/bin/import-release-team-keyring \
#     && /root/.asdf/bin/asdf plugin-add golang https://github.com/kennyp/asdf-golang.git \
#     && /root/.asdf/bin/asdf plugin-add sbt https://github.com/lerencao/asdf-sbt \
#     && /root/.asdf/bin/asdf plugin-add scala https://github.com/mtatheonly/asdf-scala \
#     && /root/.asdf/bin/asdf plugin-add kubectl https://github.com/Banno/asdf-kubectl.git \
#     && /root/.asdf/bin/asdf install

WORKDIR /root
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
