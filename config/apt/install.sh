#!/bin/sh -e
ubuntu_version="$(lsb_release -r | awk '{print $2 * 100}')"

sudo -E add-apt-repository -y ppa:git-core/ppa
sudo -E add-apt-repository -y ppa:longsleep/golang-backports
apt update
apt upgrade -y
apt install -y \
  bat \
  build-essential \
  curl \
  exa \
  fd-find \
  file \
  fzf \
  golang-go \
  git \
  hexyl \
  jq \
  neovim \
  ripgrep \
  shellcheck \
  tmux \
  vim \
  zip \
  zsh

curl -fsSL 'https://download.docker.com/linux/ubuntu/gpg' | apt-key add -
