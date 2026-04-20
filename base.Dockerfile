FROM docker.io/library/archlinux:latest

# Fix terminfo for ghostty
COPY ./terminfo-ghostty .
ENV TERMINFO=terminfo-ghostty

# Update and install some base packages
RUN pacman -Syu --noconfirm
RUN pacman -S zsh git base-devel --noconfirm

# Install yay
RUN useradd --no-create-home --shell=/bin/false build && usermod -L build
USER build
WORKDIR /tmp
RUN curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/yay-bin.tar.gz \
  && tar -xvf yay-bin.tar.gz \
  && cd yay-bin \
  && makepkg
USER root
WORKDIR /
RUN pacman -U --noconfirm /tmp/yay-bin/yay-bin-*.pkg.tar.zst \
  && rm -rf /tmp/yay-bin

# Dev tools
RUN yay -S --noconfirm \
  git lazygit curl ripgrep \
  fzf bat zoxide tmux \
  neovim python-pynvim tree-sitter-cli

# Should be overriden
RUN touch /env.sh
