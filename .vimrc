"main vim options
set number relativenumber 		"allows relative line numbers. Superior to static because of line jumping
set ignorecase 					"turns off case sensitive searching
set mouse=a 					"allows mouse clicks to do something. May want to remove this in true vim fashion
set hlsearch
set incsearch
set autoindent 					"makes indents match previous
set smartindent
set shiftwidth=4 				"sets up 4 space tabs
set tabstop=4
filetype plugin indent on 		"Enabling filetype support provides filetype-specific indenting,
runtime macros/matchit.vim 		"Hit `%` on `if` to jump to `else`. This makes jumping much smarter
set backspace=indent,eol,start 	"Intuitive backspace behavior.
set hidden                     	"Possibility to have more than one unsaved buffers.
set incsearch                  	"Incremental search, hit `<CR>` to stop.
set ruler                      	"Shows the current line number at the bottom-right of the screen
set wildmenu                   	"Great command-line completion, use `<Tab>` to move
set clipboard=unnamedplus

"remaps
nnoremap ; :

set background=dark
if has('termguicolors')
  set termguicolors
endif

"plugins section
call plug#begin()

" List your plugins here
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'

call plug#end()


"colors
syntax on 						"syntax highlighting, omni-completion and other useful settings.
colorscheme onedark

