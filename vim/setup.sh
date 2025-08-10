#!/bin/bash

# ask yes/no question
function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0 ;;  
            [Nn]*) return 1 ;;
        esac
    done
}

function press_anything {
  read -p "$* Press anything to continue " _
}

# setup coc
press_anything "Installing vim, git, curl, and npm first just in case"
sudo apt install vim git curl npm
cd ./pack/plugins/start/coc.nvim
npm ci
echo

# C/C++
yes_or_no "Install ccls? (C/C++ autocorrect)" && sudo apt install ccls

# Python3
yes_or_no "Install python3-pylsp? (python autocorrect)"
if [[ $? == 0 ]]; then
  sudo apt install python3-pylsp python3-pip
  press_anything "quit vim after coc is done"
  vim +"CocInstall @yaegassy/coc-pylsp"
fi

# Haskell
yes_or_no "Insatll ghcup and hls? (haskell tool installer and haskell autocorrect)"
if [[ $? == 0 ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
  echo
  press_anything "please run \"ghcup install gls\" in another shell"
  # ghcup install hls
fi

# Rust
yes_or_no "Install rust? (and rust autocorrect)"
if [[ $? == 0 ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  press_anything "quit vim after coc is done"
  vim +"CocInstall coc-rust-analyzer"
fi
