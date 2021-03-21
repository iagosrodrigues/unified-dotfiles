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

    if !g:coc
      " autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"ChainingHint", "TypeHint", "ParameterHint"} }
    endif

    autocmd BufWritePost init.vim,plugins.vim,ginit.vim,normal.vim ++nested source %

    " Disables automatic commenting on newline
    " autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " autocmd VimResized * exe 'normal! \<c-w>='
    autocmd FileType vim setlocal fen fdm=marker

    autocmd FileType skim tnoremap <buffer> <esc> <c-g>

    " autocmd BufWritePost *.exs,*.ex silent! call ElixirFormat()

    if !has('nvim-0.5') " Fix terminal bug glitch on every keypress
        autocmd TermEnter * setlocal scrolloff=0
        autocmd TermLeave * setlocal scrolloff=3
    endif

    autocmd FocusLost * silent! wa

    " Goyo
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!

    " autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
augroup END

augroup Term
    autocmd!
    autocmd TermOpen * setlocal nonu nornu signcolumn=no
    autocmd TermOpen * startinsert
augroup END
