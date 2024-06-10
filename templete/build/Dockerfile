FROM ljmf00/archlinux AS base

RUN pacman -Syu --noconfirm \
    && pacman -S --noconfirm \
        base-devel \
	curl \
	sudo \
        git \
        vim \
        wget \
        zsh \
        gnu-netcat \
    && pacman -Scc --noconfirm

ARG USER=coder

RUN useradd -m -G wheel -s /bin/zsh -d /home/${USER} ${USER} \
    && echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && chown -R ${USER}:${USER} /home/${USER}

USER ${USER}

WORKDIR /home/${USER}
