"" Vimtex
" vimtex neovim remote support
let g:vimtex_compiler_progname = 'nvr'

" Disable LaTeXBox in favor of vimtex
let g:polyglot_disabled = ['tex', 'latex']

" Configure vimtex
" let g:vimtex_view_method = 'zathura'
set conceallevel=1
let g:tex_conceal = 'abdmg'

" Use tectonic with vimtex
let g:vimtex_compiler_progname = 'tectonic'

" Use tmux with slime
let g:slime_target = "tmux"