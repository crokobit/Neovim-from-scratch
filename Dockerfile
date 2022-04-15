FROM ubuntu:18.04

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
# RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'silent PackerSync'
RUN nvim --headless +"sleep 5" +"autocmd User PackerComplete quitall" +"silent PackerSync"
#RUN nvim --headless +"sleep 5" +"silent TSInstall"
#RUN nvim --headless +"sleep 5" +"silent TSInstall python ql" +"sleep 60" +qa
#RUN nvim --headless +"sleep 5" +"silent TSInstall python bash" +"silent LspInstall python" +"silent LspInstall bash" +"sleep 60" +qa
RUN nvim --headless -c "TSInstallSync maintained" -c q
WORKDIR /
RUN mkdir /temp
WORKDIR /temp

# ENTRYPOINT ["/bin/bash", "-c", "nvim"]
ENTRYPOINT ["nvim"]
