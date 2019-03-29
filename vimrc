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
"au VimEnter * nmap <Esc> :pclose<cr>

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
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


""" Plugin section

"" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = 'L'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" airline bugs...
set laststatus=2

"" ale
" signs
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
"highlight ALEErrorSign ctermbg=NONE ctermfg=red
"highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_completion_enabled = 0

" python
let g:ale_python_auto_pipenv = 0
let g:ale_virtualenv_dir_names = [$VIRTUAL_ENV]

let g:ale_python_flake8_options = "--max-line-length=100"

" mypy search path
let g:ale_python_mypy_options = "--cache-dir ~/.mypy_cache --python-executable python --ignore-missing-imports"

" rust
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_rust_cargo_clippy_options = '--all-features -- -D clippy::style -D clippy::correctness -W clippy::complexity -W clippy::pedantic -W clippy::nursery -W clippy::perf -W clippy::cargo -A clippy::restriction'
let g:ale_rust_cargo_check_all_targets = 1


"" gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '≈'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '--'
let g:gitgutter_sign_modified_removed = '≈-'
let g:gitgutter_highlight_lines = 1

autocmd BufWritePost * GitGutter " update on save

"" colorscheme
set t_Co=256
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "soft"
let g:gruvbox_italicize_comments = 1
colorscheme gruvbox

"" vim-lsp + omnicomplete
if (executable('pyls'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python']
        \ })
endif
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

set omnifunc=lsp#complete
set completeopt=menuone,preview,noinsert,noselect
nmap gd :LspDefinition<cr>
nmap ge :LspDocumentDiagnostics<cr>
nmap gs :LspDocumentSymbol<cr>
nmap gt :LspTypeDefinition<cr>
nmap gh :LspHover<cr>

"" asyncomplete plugin
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_smart_completion = 1

"" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  ctermbg=238
"hi IndentGuidesEven ctermbg=239
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
:IndentGuidesEnable

"" devdoc - plugin
augroup plugin-devdocs
  autocmd!
  autocmd FileType rust,python nmap <buffer>K <Plug>(devdocs-under-cursor)
augroup END
let g:devdocs_open_cmd = 'firefox'

let g:devdocs_filetype_map = {
    \   'python': 'python',
    \   'rust': 'rust',
    \ }

"" black
let g:black_linelength = 100
augroup plugin-black
    autocmd!
    autocmd FileType python autocmd BufWritePost * silent! :BlackAutosavePython
augroup END
