Installation:

    git clone git@github.com:shenek/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update --init --recursive
    cd bundle/YouCompleteMe/
    ./install.sh --all


Plugins
=======
pathogen
  it is used to install the plugins as bundles

syntastic
  syntax checker (for python it needs flake8 to be installed)

vim-colorschemes
  some color schemes

vim-airline
  nice status bar

vim-gitgutter
  display git status in gutter

vim-multiple-cursors
  support for multiple cursors

searchcomplete
  search completion

nerdcommenter
  comments multiple lines in various programming languages

tlib_vim
  support library required by some plugins

vim-addon-mw-utils
  support library required by some plugins

vim-snipmate
  allow using snippets of the code

vim-snippets
  a colection of various snippets

vim-kivy
  kivy file syntax highlighting

vim-indent-guides
  highlight indentation levels

vim-qml
  qml file syntax highlighting

restore_view.vim
  should restore vim views(cursors, folds) properly

rust.vim
  rust syntax plugin form

YCM
  various code completions (jedi, racer required)

My Hints
========
I used to have a lot of notes about vim commands, shortcuts and other stuff spread across multiple note managing systems.
From now on. I'll use this section for such purposes.

* for multiple-cursors use ctrl+n to go into multicursor mode <ESC> to exit the mode. Selection management is done using ctrl+n, ctrl+p, ctrl+x.
* added shortcut shift+h, shift+l to switch tabs
* use tab while writing a search expression
* to comment a line try <leader> + (c )(cA)(cc)(cn)(cs)
* to use snippets enter insert mode, write and use <snippet_text><tab> to see the list of snippets examine (bundle/vim-snippets/snippets)
* To automatically format rust code you can call :RustFmt command

Features
========
I'll try to describe a particular config part in this section.
