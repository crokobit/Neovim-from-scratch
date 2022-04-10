FROM ubuntu:20.04
#FROM ubuntu:16.04

ARG NEOVIM_CONFIG_DIR="/root/.config/nvim"
RUN apt-get update -y
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:neovim-ppa/stable
#RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update -y
RUN apt-get install -y luajit
RUN apt-get install -y luarocks
RUN apt-get install -y neovim
RUN apt-get install -y git
RUN apt-get install -y ripgrep
RUN apt-get install -y build-essential
RUN mkdir -p ${NEOVIM_CONFIG_DIR}
RUN git clone https://github.com/LunarVim/Neovim-from-scratch.git ${NEOVIM_CONFIG_DIR}
#RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'silent PackerSync'

#ENTRYPOINT ["nvim"]
