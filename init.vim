call plug#begin('~/.local/share/nvim/site/plugged')
" comment is important
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'majutsushi/tagbar'
call plug#end()
nmap <F8> :TagbarToggle<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
set autoindent
set shiftwidth=2
set tabstop=2
tnoremap <Esc> <C-\><C-n>
let g:NetrwIsOpen=0
let g:netrw_keepdir=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent 20Lexplore
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <F3> :call ToggleNetrw()<CR>
autocmd BufReadPost * cd `=expand('%:p:h')`
set shell=zsh\ -i
"sp +te
"set modifiable
"autocmd BufReadPost * belowright vnew
