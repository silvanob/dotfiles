" VIM-Plug, adding plugins and stuff.
call plug#begin('~/.local/share/nvim/site/plugged')

" Here go plugins that don't need special conditionals
Plug 'udalov/kotlin-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'mtdl9/vim-log-highlighting'
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
Plug 'mbbill/undotree'
"Plug 'github/copilot.vim'

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
nnoremap <F5> :UndotreeToggle<CR>

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
if has('nvim')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme cwcolors
syntax enable

" Recommended, but optionally add:

" Set tag file if REPOBASE is set. This assumes you set the environment
" variable REPOBASE to reflect the base directory of your current project
" and generated your ctags file as $REPOBASE-objdir/tags.
if $REPOBASE != ""
  set tags=$REPOBASE-objdir/tags
endif

" Bind <F10> to a function that shows the syntax highlighting group under thecursor.
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
\       '> trans<' . synIDattr(synID(line("."),col("."),0),"name") .
\       "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Highlight trailing spaces.
let c_space_errors=1
" Don't highlight the Next match while typing a regular expression search.
set noincsearch

if has('win32') || (has('unix') && exists('$WSLENV'))
  let g:vimtex_view_general_viewer = 'SumatraPDF.exe'
  let g:vimtex_view_general_options_latexmk = '-reuse-instance'
endif
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
