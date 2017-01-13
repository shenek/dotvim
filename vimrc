" Don't use compatibility mode
set nocompatible

" Pathogen plugin
call pathogen#infect()
call pathogen#helptags()

" Syntastics recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_warning_symbol="⚠"
let g:syntastic_error_symbol="✗"
let g:syntastic_style_error_symbol="✗"
let g:syntastic_style_warning_symbol="⚠"
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_args = "--max-line-length=100"

" goto using jedi
" let g:jedi#goto_command='gf'
let g:jedi#goto_assignments_command='gf'
let g:jedi#use_tabs_not_buffers=0

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.space = "\ua0"
" airline bugs...
set laststatus=2

" clang completion for editting C sources
let g:clang_library_path='/usr/lib/llvm-3.8/lib/'
let g:clang_hl_errors=1

" gitgutter
let g:gitgutter_sign_added = '➕'
let g:gitgutter_sign_modified = '≈'
let g:gitgutter_sign_removed = '➖'
let g:gitgutter_sign_removed_first_line = '➖➖'
let g:gitgutter_sign_modified_removed = '≈➖'
let g:gitgutter_highlight_lines = 0

" syntax for files
syntax on


" line numbers
set number

" Special characters for endline etc
set list
set listchars=trail:·,tab:▸\ ,eol:¬

" indentation for specific file types
filetype plugin indent on

" tab handling
set shiftwidth=4
set tabstop=4  "tab is displayed as 4 spaces
set smarttab

" keep the cursor in the screen center
set scrolloff=999

" highligth cursor row and column
set cursorline
set cursorcolumn

" mouse settings
set mouse=a

" search updates
set hlsearch
set incsearch
set smartcase

" folding
set foldmethod=syntax
noremap <space> za

" tab switch
noremap <s-l> gt
noremap <s-h> gT

" remap ctrl + space to code completion
inoremap <c-@> <c-x><c-o>

" File completion with crtl + f
inoremap <c-f> <c-x><c-f>

" remap some Editor commands
command! E Explore
command! Ve Vexplore
command! Te Texplore
command! He Hexplore
command! Le Lexplore
command! Se Sexplore

" map leader keys (should be used in a new plugins)
let mapleader=","
let maplocalleader=","

" beter :xx<tab> completion
set wildmenu

" color scheme
set t_Co=256
colorscheme zenburn
let g:zenburn_high_Contrast = 1
let g:zenburn_force_dark_Background = 1

" indent-guidelines-plugin colors
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  ctermbg=238
"hi IndentGuidesEven ctermbg=239
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" set custom location of view dir
set viewdir=~/.vimview/

" set the proper shell
set shell=/bin/bash

" rust section
let g:rustfmt_command = "~/.cargo/bin/rustfmt"
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
