FROM ubuntu:21.10

ARG NEOVIM_CONFIG_DIR="/root/.config/nvim"
RUN apt-get update -y
RUN apt-get install -y gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl
RUN apt-get install -y git
RUN git clone https://github.com/neovim/neovim
WORKDIR /neovim
RUN make
RUN make install

RUN mkdir -p ${NEOVIM_CONFIG_DIR}
RUN git clone -b crokobit https://github.com/crokobit/Neovim-from-scratch.git ${NEOVIM_CONFIG_DIR}
RUN nvim --headless +"sleep 5" +"autocmd User PackerComplete quitall" +"silent PackerSync"
RUN nvim --headless -c "TSInstallSync maintained" -c q

RUN apt-get install ripgrep fd-find
RUN apt install -y ruby-full

ENV DEBIAN_FRONTEND noninteractive
RUN apt install -y python3

RUN apt-get install -y golang-go
RUN apt-get install -y python3-pip
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y nodejs
RUN apt install -y wget
RUN npm install -g typescript typescript-language-server

WORKDIR /
RUN mkdir /temp
WORKDIR /temp

# ENTRYPOINT ["/bin/bash", "-c", "nvim"]
ENTRYPOINT ["nvim"]
