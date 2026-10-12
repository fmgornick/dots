nvim-install-nightly() {
    pushd $XDG_BIN_HOME
    rm -rf nvim*
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz
    xattr -c ./nvim-linux-x86_64.tar.gz
    tar xzvf nvim-linux-x86_64.tar.gz
    ln -sf nvim-linux-x86_64/bin/nvim nvim
    popd
} &> /dev/null
