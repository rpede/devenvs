RUN yay -S --noconfirm nodejs nvm pnpm

COPY --chmod=666 ./node.env.sh /env.sh
