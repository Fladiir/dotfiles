set encoding=utf-8
set number
execute pathogen#infect()
syntax on
filetype plugin indent on
set laststatus=2
set showtabline=2
" ++++++++ Lightline configuration ++++++++
let g:lightline = {
	\ 'colorscheme': 'Tomorrow_Night',
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': ''},
	\ 'tabline': {
	\	'left': [ [ 'bufferinfo' ],
	\			  ['bufferbefore'], ['buffercurrent'], ['bufferafter'] ],
	\	'right':[ [ 'absolutepath' ] ]
	\	},
	\ 'active': {
	\   'left': [ [ 'mode', 'paste'],
	\             [ 'fugitive', 'rwstat' ],
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
