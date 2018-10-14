" Don't use compatibility mode
set nocompatible

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

" set the proper shell
set shell=/bin/bash

" load all necessary plugins
packloadall
" load all helptads (errors will be ignored)
silent! helptags ALL

" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" close previews by escape
au VimEnter * nmap <Esc> :pclose<cr>

" temporary files
set backupdir=~/.vim-temp,.
set directory=~/.vim-temp,.
set viminfo='20,\"50,n~/.vim-temp/_viminfo
set viewdir=~/.vim-temp/viewdir/

" omni completion
" remap ctrl + space to code completion
inoremap <c-@> <c-x><c-o>
" File completion with crtl + f
inoremap <c-f> <c-x><c-f>
" closes preview after completion
autocmd CompleteDone * pclose


""" Plugin section

"" vim-airline
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

"" ale
" signs
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" python
let g:ale_python_flake8_auto_pipenv = 1
let g:ale_python_flake8_options = "--max-line-length=100"
let g:ale_python_mypy_options = "--cache-dir ~/.mypy_cache"

"" gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '≈'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '--'
let g:gitgutter_sign_modified_removed = '≈-'
let g:gitgutter_highlight_lines = 0

autocmd BufWritePost * GitGutter " update on save

"" colorscheme
set t_Co=256
colorscheme zenburn

let g:zenburn_high_Contrast = 1
let g:zenburn_force_dark_Background = 1

"" vim-lsp + omnicomplete
if (executable('pyls'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python']
        \ })
endif

set omnifunc=lsp#complete
map gd :LspDefinition<cr>
map ge :LspDocumentDiagnostics<cr>
map gs :LspDocumentSymbol<cr>
map gt :LspTypeDefinition<cr>
map gh :LspHover<cr>

"" asyncomplete plugin
let g:asyncomplete_auto_popup = 0

"" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  ctermbg=238
"hi IndentGuidesEven ctermbg=239
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
:IndentGuidesEnable
