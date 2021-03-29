" VIM-Plug, adding plugins and stuff.
call plug#begin('~/.local/share/nvim/site/plugged')

" Here go plugins that don't need special conditionals
Plug 'udalov/kotlin-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'mtdl9/vim-log-highlighting'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'roxma/vim-tmux-clipboard'
Plug 'RyanMillerC/better-vim-tmux-resizer'
Plug 'hashivim/vim-vagrant'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'lervag/vimtex'
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
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>
nmap <silent> <F8> :TagbarToggle<CR>
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
tnoremap <Esc> <C-\><C-n>
noremap <silent> <F3> :call ToggleNetrw()<CR>

" Autocmd 
autocmd BufReadPost * cd `=expand('%:p:h')`

" VIM variables
set autoindent
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set termguicolors
set clipboard=unnamedplus
set splitbelow
set splitright
set mouse=nv
set number " Show current line number
set relativenumber " Show relative line numbers

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
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
