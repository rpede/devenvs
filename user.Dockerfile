# Add normal user
RUN useradd -m -s /usr/bin/zsh user
# Configure environment
USER user
WORKDIR /home/user
RUN git clone https://github.com/LazyVim/starter ~/.config/nvim
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN sed -i "s/^plugins=.*$/plugins=(git cp extract vi-mode command-not-found zsh-interactive-cd)/" ~/.zshrc
COPY ./zshrc .
RUN cat zshrc >> .zshrc && rm zshrc
RUN cat /env.sh >> ~/.zshrc

ENTRYPOINT /usr/bin/zsh
