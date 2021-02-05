" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
call plug#end()

" Variables
set number
set mouse=a
set nocompatible
filetype plugin on
set autochdir
set hidden
set clipboard+=unnamedplus
set nobackup
set nowritebackup
set shortmess+=c
set wildmenu
set updatetime=300
set laststatus=0

" Interface changes
func DisplayFilename(timer)
  exec "echo expand('%:p')"
endfunc
let timer = timer_start(3000, 'DisplayFilename', {'repeat': -1})
hi! EndOfBuffer ctermbg=white ctermfg=white guibg=white guifg=white
hi VertSplit cterm=NONE
hi LineNr ctermfg=grey
hi! StatusLineNC ctermfg=grey ctermbg=grey

" Misc keybindings
let mapleader = "\<Space>" 
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nmap U :redo <CR>
nmap <leader>p :Files<CR> 
nmap <leader>r <Plug>(coc-rename)
nmap <leader>n :NERDTreeToggle<cr>:normal P<cr>:normal O<cr>
nmap <leader>e <C-w><C-w>

" Terminal
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction
nnoremap <A-z> :call TermToggle(10)<CR>
inoremap <A-z> <Esc>:call TermToggle(10)<CR>
tnoremap <A-z`> <C-\><C-n>:call TermToggle(10)<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" Autocompletion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd CursorHold * silent call CocActionAsync('highlight')

" Filemanagement
let NERDTreeWinSize = 20
let NERDTreeMinimalUI=1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
	\ quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
	\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

