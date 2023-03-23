call plug#begin()
Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

set termguicolors     " enable true colors support
set encoding=utf-8
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

set number
"set mousemodel=extend
set modelines=0
set nomodeline
set tabstop=2
set shiftwidth=2
set noshowmode
set termguicolors

let g:lightline = {
	\ 'colorscheme': 'one',
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': ''},
	\ 'active': {
	\   'left': [ 
	\			[ 'mode', 'paste'],
	\     [ 'rwstat', 'fugitive' ],
	\			[ 'filename', 'gutentags' ] ],
	\		'right': [ 
	\			[ 'filetype' ],
	\			[ 'lineinfo' ] ]
	\	},
	\ 'component': {
	\			'file_info': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
	\	},
	\ 'component_function' : {
	\			'fugitive': 'FugitiveHead',
	\			'rwstat': 'LightlineRWStat',
	\			'gutentags': 'LightlineGutentags',
	\	}
\ }

function! LightlineGutentags()
	let status = gutentags#statusline()
	return status
endfunction

function! LightlineRWStat()
  let isReadonly = &ft !~? 'help' && &readonly ? "": ""
  let isModified = &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '[+]' : &modifiable ? '' : '[-]'
  return isModified . isReadonly
endfunction

let g:ale_linters = {'gcc' : ['gcc']}
let g:ale_linters_explicit = 1
let g:gutentags_project_root = ['*.ioc', '.git', 'Makefile' ]
set complete=.,b,w,u,d,t,i
filetype plugin on
set omnifunc=ale#completion#OmniFunc
"let g:ale_completion_enabled = 1

" KEYBINDINGS
map <C-right> 	<C-w>l
map <C-left> 	<C-w>h
map <C-up> 	<C-w>k
map <C-down> 	<C-w>j
map <C-S> :vs<CR>
map <C-H> :sp<CR>

hi link @variable Normal
hi @property guifg=#f07178
hi link @parameter Normal

autocmd BufRead *.conf set ft=conf

lua << EOF
require 'nvim-treesitter.install'.prefer_git = false
require 'nvim-treesitter.install'.compilers = { "gcc" }

require 'nvim-treesitter.configs'.setup{
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}

EOF


