FROM ljmf00/archlinux AS base

RUN pacman -Syu --noconfirm \
    && pacman -S --noconfirm \
        base-devel \
        git \
        vim \
        wget \
        zsh \
    && pacman -Scc --noconfirm

ARG USER=coder

RUN useradd --groups sudo --no-create-home --shell /bin/bash ${USER} \
	&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
	&& chmod 0440 /etc/sudoers.d/${USER}

USER ${USER}

WORKDIR /home/${USER}
