FROM archlinux/archlinux:latest

# Update the system
RUN pacman -Sy --noconfirm

# Install necessary packages
RUN pacman -S --noconfirm --needed \
  base-devel \
  procps-ng \
  file \
  git \
  vim \
  curl \
  zsh \
  bash

# Install Homebrew using zsh
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

RUN brew install auto-jump spaceship zsh-autocomplete zsh-autosuggestions zsh-syntax-highlighting
# # Install Oh My Zsh
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

# Set zsh as the default shell
RUN chsh -s $(which zsh)

CMD ["zsh"]