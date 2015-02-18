Installation:

    git clone git@github.com:shenek/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update


Plugins
=======
pathogen
  it is used to install the plugins as bundles

jedi-vim
  python code completion

syntastic
  syntax checker (for python it needs flake8 to be installed)

vim-colorschemes
  some color schemes

vim-airline
  nice status bar

clang_complete
  clang completion for C/C++ code (needs llvm installed + paths set)

Features
========
I'll try to describe a particular config part in this section.

My Hints
========
I used to have a lot of notes about vim commands, shortcuts and other stuff spread across multiple note managing systems.
From now on. I'll use this section for such purposes.
