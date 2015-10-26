# Build with:
# docker build --rm -t everbot/archlinux-basic .
# Run with:
# docker run -ti --restart always --name ltt-arch -v $(pwd):/data everbot/archlinux-basic

FROM everbot/archlinux
MAINTAINER everbot

RUN pacman -Syy && \
    pacman --noconfirm -Syu

RUN pacman --noconfirm -S base-devel
RUN pacman --noconfirm -S git vim
RUN pacman --noconfirm -S ruby python
RUN pacman --noconfirm -S the_silver_searcher
RUN pacman --noconfirm -S tmux zsh
RUN pacman --noconfirm -S ranger
RUN pacman --noconfirm -S ttf-dejavu

# fix key repetition when running tmux
RUN pacman --noconfirm -S rxvt-unicode

RUN useradd -m -g users -s /bin/zsh tung && \
    echo "tung ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    sed -i '/Defaults    requiretty/d' /etc/sudoers

USER tung

# install `package-query`
RUN mkdir ~/Downloads && \
    cd ~/Downloads && \
    curl -O https://aur4.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz && \
    tar xzvf package-query.tar.gz && \
    cd package-query && \
    makepkg -sri --noconfirm

# install `yaourt`
RUN cd ~/Downloads && \
    curl -O https://aur4.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz && \
    tar xzvf yaourt.tar.gz && \
    cd yaourt && \
    makepkg -sri --noconfirm

ADD bootstrap.sh /home/tung/bootstrap.sh
RUN sudo chown tung:users /home/tung/bootstrap.sh && chmod a+rx /home/tung/bootstrap.sh

# dotfiles stuff
RUN mkdir ~/dev
RUN cd ~/dev/ && \
    git clone http://github.com/everbot/mylinux && \
    cd mylinux && \
    bash setup.sh

# some additional packages {{{
RUN yaourt --noconfirm -S neovim-git
# end additional packages }}}

CMD ["/home/tung/bootstrap.sh", "-zsh"]

