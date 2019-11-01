call plug#begin("$HOME/.config/nvim/bundle")
Plug 'itchyny/lightline.vim'
Plug 'yuttie/hydrangea-vim'
Plug 'drmikehenry/vim-fontsize'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'tikhomirov/vim-glsl'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'lambdalisue/vim-fullscreen'
Plug 'tomlion/vim-solidity'
Plug 'dracula/vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'dylanaraps/wal.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'leafgarland/typescript-vim'
call plug#end()

set encoding=utf-8
let g:indent_guides_enable_on_vim_startup=1
set guifont=Consolas:h11:cANSI
set guifontwide=NanumGothicCoding:h10:cDEFAULT
colorscheme afterglow

" language messages en

set fileencoding=utf-8
set incsearch
set hlsearch
set tabstop=4       " specifies the width of a tab character
set shiftwidth=4    " determines the amount of whitespaces to insert or remove using the indentation
set softtabstop=4   " when enabled, fine tunes the amount of whitespace to be inserted
set expandtab       " when enabled, causes spaces to be used in place of tab characters
" set smarttab
set number
" set laststatus=2
set noshowmode
set wildmenu
set ignorecase
" set smartcase
" set noeb vb t_vb=
set formatprg=par\ -w60
set cursorline
set showtabline=2

let g:lightline={
            \ 'colorscheme': 'dracula',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status'
            \ },
            \ }
syntax on

let g:indent_guides_auto_colors=0
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1

" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#343841 ctermbg=NONE
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#494b54 ctermbg=NONE

map <A-q> {v}!par -w60<CR>
vmap <A-q> !par -w60<CR>

set directory=$HOME/.config/nvim/backup
set backupdir=$HOME/.config/nvim/backup

set list
set listchars=tab:>\ ,eol:$

autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" hi CursorLine gui=None
hi CursorLine ctermfg=none
hi CursorLine ctermbg=none
hi Incsearch cterm=none
hi NonText ctermfg=8
hi MatchParen ctermfg=white ctermbg=3

" let g:netrw_cygwin = 1
" let g:netrw_scp_cmd = '"C:\Program Files (x86)\PuTTy\pscp.exe" -l jake -pw nise4423'

let g:netrw_cygwin = 0
let g:netrw_scp_cmd  = 'scp'

augroup TerminalStuff
    au!
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen * setlocal signcolumn=no
augroup END

tnoremap <s-space> <space>

let @b = 'acmake --build .'

command Tabt tabedit term:///bin/bash
command Et edit term:///bin/bash

" Coc

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `\N` and `\n` for navigate diagnostics
nmap <silent> \N <Plug>(coc-diagnostic-prev)
nmap <silent> \n <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_node_path='/home/asdf/.nvm/versions/node/v12.13.0/bin/node'

" highlight SignColumn guibg=NONE
" highlight LineNR guibg=NONE guifg=

set t_Co=256

set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

func! ChangeDirectory(buffername)
    let pid = substitute(a:buffername, 'term://.//', '', '')
    let pid = substitute(pid, ':.*$', '', '')
    let pwd = system('readlink -e /proc/' . pid . '/cwd')
    execute 'cd' pwd
endfunction

let @c = ':call ChangeDirectory(@%)'
