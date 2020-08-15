syntax on

set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set autoindent 
set ttyscroll=3
set clipboard=unnamedplus
set hlsearch

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'vim-utils/vim-man'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'kien/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'majutsushi/tagbar'
Plug 'raimondi/delimitmate'
Plug 'pechorin/any-jump.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jremmen/vim-ripgrep'
Plug 'machakann/vim-highlightedyank'
Plug 'terryma/vim-expand-region'
Plug 'severin-lemaignan/vim-minimap'
call plug#end()

colorscheme gruvbox
set background=dark

let g:minimap_toggle='<leader>mm'

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 15
let g:any_jump_disable_default_keybindings = 1

let g:highlightedyank_highlight_duration = 300

let mapleader = " "
nnoremap <leader>f :AnyJump<CR>
nnoremap <leader>al :AnyJumpLastResults<CR>

nnoremap <leader>h :wincmd h<CR>
noremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>

noremap <leader>q :noh<CR>
nnoremap <esc><esc> :noh<return>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

let g:airline_theme='simple'

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

nnoremap <C-g> :GoDef<CR>
nnoremap <leader>gc :GoBuild<CR>
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }

nnoremap <F5> :UndotreeToggle<cr>

set guifont=Monospace\ 11


let g:NetrwIsOpen=0

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
        silent Lexplore
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <leader>e :call ToggleNetrw()<CR>
:map <silent> <S-Insert> "+p
:imap <silent> <S-Insert> <Esc>"+pa
nmap <C-F12> :TagbarToggle<CR>
nmap <C-S-N> :bn<CR>
nmap <C-S-B> :bp<CR>
nnoremap <c-k> :<c-u>call search('\u')<cr>

nnoremap cn :cnext<cr>
nnoremap cb :cprevious<cr>

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
