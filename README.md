# DevEnvs

A crude (highly opinionated) setup for starting development environment
containers.

Features:

- archlinux
- oh-my-zsh
- lazyvim

## Requirements

`just`, `docker` or `podman`

## Add environment

Say you want an environment for python.

Add a `python.Dockerfile`.
Instructions will run between `base.Dockerfile` and `user.Dockerfile`.

You can add a `python.env.sh` with commands that needs to run.
Add `COPY --chmod=666 ./python.env.sh /env.sh` to `python.Dockerfile`.
`/env.sh` will be appended to `~/.zshrc`
