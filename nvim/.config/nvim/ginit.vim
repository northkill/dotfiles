let g:fullscreen#start_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 1)"
let g:fullscreen#stop_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 0)"

" from https://jdhao.github.io/2019/01/17/nvim_qt_settings_on_windows/

call GuiClipboard()

GuiTabline 0
GuiPopupmenu 0

colorscheme dracula

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

let g:indent_guides_auto_colors=1

call lightline#init()
call lightline#colorscheme()

set guicursor=

" highlight SignColumn guibg=dark ctermbg=0
" highlight SignColumn guibg=gray10
" highlight LineNR guibg=gray10

highlight! link NonText DraculaSubtle
