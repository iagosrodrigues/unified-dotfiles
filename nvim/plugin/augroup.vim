augroup Trailing
    autocmd!

    " Automatically deletes all trailing whitespace on save
    autocmd BufWritePre * %s/\s\+$//e
augroup END

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=50}
augroup END

augroup Config
    autocmd!

    autocmd BufWritePost init.vim,plugins.vim,ginit.vim,normal.vim ++nested source %

    " Disables automatic commenting on newline
    " autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " autocmd VimResized * exe 'normal! \<c-w>='
    autocmd FileType vim setlocal fen fdm=marker

    autocmd FileType skim tnoremap <buffer> <esc> <c-g>

    " autocmd BufWritePost *.exs,*.ex silent! call ElixirFormat()

    autocmd FocusLost * silent! wa

    " highlight NonText guifg=#6272a4

    " Goyo
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
augroup END

augroup Term
    autocmd!
    autocmd TermOpen * setlocal nonu nornu signcolumn=no
    autocmd TermOpen * startinsert
augroup END
