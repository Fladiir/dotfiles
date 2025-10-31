call plug#begin()
"Plug 'ayu-theme/ayu-vim'
Plug 'Luxed/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
"Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'nvim-mini/mini.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'elkowar/yuck.vim'
Plug 'mbbill/undotree'
call plug#end()

set termguicolors     " enable true colors support
set encoding=utf-8
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
"colorscheme ayu
colorscheme catppuccin-mocha

set number
"set mousemodel=extend
set modelines=0
set nomodeline
set tabstop=2
set shiftwidth=2
set noshowmode
set termguicolors
set cul

"hi Normal guibg=#0d1117 ctermbg=NONE
"hi CursorLine ctermbg=none guibg=none
"hi link @variable Normal
"hi @property guifg=#f07178
"hi link @parameter Normal
"hi @parameter gui=none
"hi! link @type.builtin Type

	"\ 'separator': { 'left': '', 'right': '' },
	"\ 'subseparator': { 'left': '', 'right': ''},
let g:lightline = {
	\ 'colorscheme': 'catppuccin',
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

set complete=.,b,w,u,d,t,i
filetype plugin on
set omnifunc=ale#completion#OmniFunc

" KEYBINDINGS
map <C-right> 	<C-w>l
map <C-left> 	<C-w>h
map <C-up> 	<C-w>k
map <C-down> 	<C-w>j
map <C-S> :vs<CR>
map <C-H> :sp<CR>

map <C-p> :Pick files<CR>
map <C-b> :Pick buffers<CR>
map <C-g> :Pick grep_live<CR>



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

-- Center float
local win_config = function()
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)
    return {
        anchor = 'NW', 
        height = height, 
        width  = width,
        row    = math.floor(0.5 * (vim.o.lines - height)),
        col    = math.floor(0.5 * (vim.o.columns - width)),
    }
end


require('mini.pick').setup({
 -- Window related options
  window = {
    -- Float window config (table or callable returning it)
    config = win_config,

    -- String to use as caret in prompt
    prompt_caret = '▏',

    -- String to use as prefix in prompt
    prompt_prefix = '> ',
  },
})

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    float = {
        transparent = false, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
    },
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
    },
    color_overrides = {
			mocha = {
				base = "#0d1117"	
			}
		},
    custom_highlights = {},
    default_integrations = true,
    auto_integrations = false,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

EOF


