" VIM-Plug, adding plugins and stuff.
call plug#begin('~/.local/share/nvim/site/plugged')

" Here go plugins that don't need special conditionals
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'

" Other plugins that only load on certain conditions
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Plugin configuration stuff
let g:deoplete#enable_at_startup = 1

call plug#end()

" Plugin config stuff that can't be put inside the plug#start and plug#end
" section
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Remapping
nmap <silent> <F8> :TagbarToggle<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
tnoremap <Esc> <C-\><C-n>
noremap <silent> <F3> :call ToggleNetrw()<CR>

" Autocmd 
autocmd BufReadPost * cd `=expand('%:p:h')`

" VIM variables
set autoindent
set shiftwidth=2
set tabstop=2
set termguicolors
set clipboard=unnamedplus

" g: variables
let g:NetrwIsOpen=0
let g:netrw_keepdir=0


"----------Functions----------"

" Toggle the file tree on the left
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
