FROM debian

ENV \
    DEBIAN_FRONTEND=noninteractive

RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        ca-certificates curl git vim xz-utils zip unzip bzip2 re2c supervisor
#        zsh

#RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#RUN chsh -s $(which zsh)
#WORKDIR /root/.oh-my-zsh/custom/plugins
#RUN \
#    git clone https://github.com/zsh-users/zsh-syntax-highlighting && \
#    git clone https://github.com/zsh-users/zsh-autosuggestions

RUN mkdir -p /etc/supervisor/conf.d

ADD rootfs /

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]

WORKDIR /root
