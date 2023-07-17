FROM ljmf00/archlinux AS base

RUN pacman -Syu --noconfirm \
    && pacman -S --noconfirm \
        base-devel \
        git \
        vim \
	wget \
        zsh \
    && pacman -Scc --noconfirm

RUN mkdir -p /home/coder

RUN useradd -m -G wheel -s /bin/zsh -d /home/coder coder \
    && echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && chown -R coder:coder /home/coder

USER coder

RUN ls -a

RUN sudo wget https://download.docker.com/linux/static/stable/aarch64/docker-24.0.4.tgz \ 
    && sudo tar xzvf docker-24.0.4.tgz \
    && sudo cp docker/* /usr/bin/

RUN curl -fsSL https://coder.com/install.sh | sh

RUN ls /usr/bin/ -a

EXPOSE 8080

CMD coder server
