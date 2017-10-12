execute pathogen#infect()
set smartindent
set encoding=utf-8
" Syntax
syntax on
filetype plugin indent on
set background=dark
set incsearch
set hlsearch
set ignorecase
set smartcase
colorscheme material
set wildmenu
"   Statusbar
set noshowmode
set laststatus=2
set showtabline=2
let g:livepreview_previewer = 'evince'
set number
" colorscheme
hi! Comment ctermfg=6
"hi! LineNr ctermfg=172
hi! LineNr ctermfg=6
hi! vimOption ctermfg=9
"---------- KEYBINDS ----------
"map Q :NERDTreeToggle<CR>
"map <C-left> :NERDTreeFocus<CR>
"map <C-right> <C-w>l
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" ++++++++ Lightline configuration ++++++++
let g:lightline = {
			\ 'colorscheme': 'material',
			\ 'separator': { 'left': '', 'right': '' },
			\ 'subseparator': { 'left': '', 'right': ''},
			\ 'tabline': {
			\	'left': [ [ 'bufferinfo' ],
			\			  ['bufferbefore'], ['buffercurrent'], ['bufferafter'] ],
			\	'right':[ [ 'absolutepath' ] ]
			\	},
			\ 'active': {
			\   'left': [ [ 'mode', 'paste'],
			\	     [ 'fugitive', 'rwstat' ],
			\			  [ 'filename' ] ],
			\	'right': [ [ 'syntastic', 'whitespace', 'lineinfo' , 'percent' ],
			\			   [ 'file_info' ],
			\			   [ 'filetype' ] ]
			\	},
			\ 'component': {
			\	'file_info': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]'
			\	},
			\ 'component_expand': {
			\	'whitespace': 'WhitespaceCheck',
			\	'buffercurrent': 'lightline#buffer#buffercurrent2',
			\	'syntastic': 'SyntasticStatuslineFlag'
			\	},
			\ 'component_type': {
			\	'whitespace': 'warning',
			\	'syntastic': 'error'
			\	},
			\ 'component_function' : {
			\	'fugitive': 'LightLineFugitive',
			\	'rwstat': 'LightLineRWStat',
			\	'bufferbefore': 'lightline#buffer#bufferbefore',
			\	'bufferafter': 'lightline#buffer#bufferafter',
			\	'bufferinfo': 'lightline#buffer#bufferinfo'
			\	}
			\ }
$



" ++++++++ Lightline Functions ++++++++
" Fugitive-related status string
function! LightLineFugitive()
	if exists("*fugitive#head")
		let branch = fugitive#head()
		return branch !=# '' ? ' '.branch : ''
	endif
	return ''
endfunction

" Read-Write status string
function! LightLineRWStat()
	let isReadonly = &ft !~? 'help' && &readonly ? "": ""
	let isModified = &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '[+]' : &modifiable ? '' : '[-]'
	return isModified . isReadonly
endfunction
augroup autoFileRecognition
	autocmd!
	autocmd BufRead,BufNewFile *.nasm,*.asm set filetype=nasm
augroup END

