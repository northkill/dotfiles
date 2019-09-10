" Vundle
set nocompatible
filetype off
set rtp+=$HOME/.config/nvim/bundle/Vundle.vim

call vundle#begin("$HOME/.config/nvim/bundle")
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'yuttie/hydrangea-vim'
Plugin 'drmikehenry/vim-fontsize'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'lambdalisue/vim-fullscreen'
Plugin 'tomlion/vim-solidity'
Plugin 'dracula/vim'
Plugin 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install() }}
Plugin 'dylanaraps/wal.vim'
call vundle#end()
filetype plugin indent on

set encoding=utf-8
let g:indent_guides_enable_on_vim_startup=1
set guifont=Consolas:h11:cANSI
set guifontwide=NanumGothicCoding:h10:cDEFAULT
colorscheme dracula

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

let @b = 'acmake --build ..'

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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

" highlight SignColumn guibg=NONE
" highlight LineNR guibg=NONE guifg=

set t_Co=256

set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

highlight! link NonText DraculaSubtle
