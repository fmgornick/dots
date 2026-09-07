nvim-install-nightly() {
    pushd $XDG_BIN_HOME
    rm -rf nvim*
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz
    xattr -c ./nvim-macos-arm64.tar.gz
    tar xzvf nvim-macos-arm64.tar.gz
    ln -sf nvim-macos-arm64/bin/nvim nvim
    popd
} &> /dev/null
