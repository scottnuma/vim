set nocompatible
filetype off  
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'

	" Use colorful rainbow parentheses
	Plugin 'luochen1990/rainbow'
		let g:rainbow_active = 1

	" Treat window and tmux navigation the same
	Plugin 'christoomey/vim-tmux-navigator'

	" Gotham color scheme
	" Plugin 'whatyouhide/vim-gotham'

	" ctags
	" Plugin 'craigemery/vim-autotag'
        
        " vim-go
        Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
        set autowrite                           " Save on GoBuild etc
        let g:go_fmt_command = "goimports"      " Use goimports over gofmt
        let g:go_highlight_types = 1            " Use better syntax highlighting
        let g:go_highlight_fields = 1
        let g:go_highlight_functions = 1
        let g:go_highlight_function_calls = 1



	" NERDTree
	Plugin 'scrooloose/nerdtree'
		map <C-n> :NERDTreeToggle<CR>

		" Close window if only window left is NERDTree
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

call vundle#end()


" Includue FZF command
set rtp+=~/.fzf

" set ctrl-p to FZF fuzzy searching
nnoremap <silent> <C-p> :FZF<CR>

filetype plugin indent on

:imap jk <Esc>
:imap jj <Esc>

" Use the insert key to toggle paste mode in insert mode
set pastetoggle=<Insert>

set relativenumber
set number
syntax enable
"
" Always display the status line
set laststatus=2
 
set statusline=%f\      "filename
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

set statusline+=%=      "left/right separator

set statusline+=C%c\      "cursor column

" Set status line to light blue on gray
hi StatusLine ctermbg=black ctermfg=4

" Enable viusal mode for all modes
:set mouse=a

let mapleader = ";"

" Highlight all search matches
set hlsearch

" Set mapping for switching between buffers
map <leader>j :bp!<CR>
map <leader>k :bn!<CR>
map <leader>w :bd<CR>
map <leader>W :w<CR>:bd<CR>

" Set shortcut for vim spitting the screen
map <leader>h :sv<CR>
map <leader>v :vs<CR>

" Use ctrl-c and ctrl-v for interacting with the system clipboard
:inoremap <C-v> <ESC>"+pa
:vnoremap <C-c> "+y
:vnoremap <C-d> "+d

" Set the tab spacing for ruby files
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype c setlocal ts=2 sts=2 sw=2
autocmd Filetype go setlocal ts=4 sts=4 sw=4

" Spaces not tabs
set expandtab

" When a single line wraps around, use j and k to navigate inside the lines
nnoremap j gj
nnoremap k gk

" make backspace work across lines
set backspace=2 

" Look in parent directories for the ctags tags file
set tags+=tags;~
