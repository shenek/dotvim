" Pathogen plugin
call pathogen#infect()
call pathogen#helptags()

" Syntastics recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" goto using jedi
" let g:jedi#goto_command='gf'
let g:jedi#goto_assignments_command='gf'
let g:jedi#use_tabs_not_buffers=0

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

syntax on

" color scheme
:colorscheme 256-grayvim
