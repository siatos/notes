" get out of horrible vi-compatible mode
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/')

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive' 
Plugin 'tomasr/molokai'
Plugin 'scrooloose/syntastic'
Plugin 'arcticicestudio/nord-vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'groovy.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'groovyindent'
Plugin 'tmhedberg/SimpylFold'
Plugin 'elixir-editors/vim-elixir'
Plugin 'Tagbar'
Plugin 'rust-lang/rust.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " re-enable filetype detection after Vundle has been loaded 

set backspace=indent,eol,start  " enable backspace working in insert mode. This overrides default behaviour!

" Proper PEP8 indentation [with the exception of width set to 120 chars since 80 chars seems a little restrictive nowadays]
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" For full stack development i.e. html, javascript, css and add whatever you like
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |

set encoding=utf-8

" set font to Courier:10
set guifont=Courier:10
colorscheme evening


" Search in regexp (not fuzzy) mode by default (can be toggled with <c-r>)
let g:ctrlp_regexp = 1

" Change the postion, the listing order of results, the minimum and the maximum heights of the match window
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:15,results:15'

let python_highlight_all=1

" use :verbose set wrapmarging? :verbose set textwidth :verbose set formatoptions 
" or                            :verbose set tw        :verbose set fo   
" to verify current options
" wrapmargin=120 textwidth=0 formatoptions=cq only
" see https://vi.stackexchange.com/questions/1983/how-can-i-get-vim-to-stop-putting-comments-in-front-of-new-lines
set wrapmargin=120
set fo-=t


" 256 color mode
set t_Co=256

syntax on
set wildmode=longest,list

"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead,BufNewFile *.robot set filetype=robot
autocmd BufRead,BufNewFile *.py set filetype=python
autocmd BufRead,BufNewFile *.pl set filetype=perl
autocmd BufRead,BufNewFile *.gvy set filetype=groovy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#,-


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" command-line completion operates in an enhanced mode
set wildmenu

" Show the line and column number of the cursor position
set ruler

" Print the line number in front of each line
set number

" do not redraw while running macros (much faster) (LazyRedraw)
set lazyredraw

" use mouse everywhere
set mouse=a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show matching brackets for a moment
set showmatch

" how many tenths of a second to blink matching brackets for
set matchtime=20

" do not highlight searched phrases
set nohlsearch

" but do highlight as you type your search phrase
set incsearch


" set status line visible to any window
set laststatus=2
" set custom color for part of status line
hi user1 ctermbg=black ctermfg=white   guibg=black guifg=white
hi user2 ctermbg=yellow ctermfg=blue  guibg=yellow guifg=blue
hi user3 ctermbg=black ctermfg=yellow   guibg=black guifg=yellow

" set statusline=%{fugitive#statusline()}\ %F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" set statusline
set statusline=%1*%{fugitive#statusline()} 
set statusline+=%F%m%r%h%w%*                                               " up to this point custom color 1 and restore after this
" set statusline+=[FORMAT=%{&ff}]
" set statusline+=[TYPE=%Y]                            		               " set file type 
set statusline+=%2*\ \ [BUFFNO=%n]                                         " set buffer number color with custom color 2
set statusline+=\ [F2=ToggleWindow\ F12=ToggNerdTRee\ F9=TagBarToggle]%*   " display some used key combs and restore after this 
set statusline+=%=                                   		               " right justify from now on
set statusline+=%3*[POS=%04l,%04v][%p%%][LEN=%L]\ \ %*   	               " display current cursor position and total line length using custom color 3 restore after this



" Syntastic recommended settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_aggregate_errors = 1

" Show the cursor
set cursorline
set cursorcolumn

set ignorecase

" set fold method based on filetype
let g:SimpylFold_docstring_preview = 1 

" set foldenable only if F2 is pressed
set nofoldenable  " start with no folds
" noremap <F2> :set foldenable <CR>


set foldmethod=indent
set foldnestmax=2

" autocmd filetype perl set foldmethod=syntax
" autocmd filetype python set foldmethod=indent
" autocmd filetype vim set foldmethod=manual
" nnoremap <space> za
" vnoremap <space> zf
" set foldlevel=99

" change displayed NERDTree symbols
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" show hidden files with NERDTree
let NERDTreeShowHidden=1

" Custom bindings
" map F12 to NERDTree Toggle
noremap <F12> :NERDTreeToggle <CR>

" map F10 to go to tag in a vertical split window
set tags=$HOME/git/tags;
noremap <F10> :vsp<CR><C-w><C-w><c-]>

" map F9 to Toggle TagBar
nmap <F9> :TagbarToggle<CR>

" set TagBar iconchars to +,-
let g:tagbar_iconchars = ['+', '-']


" need to set below vars for TagBar to work properly
let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package:1',
        \ 'c:classes',
        \ 'i:interfaces',
        \ 't:traits',
        \ 'e:enums',
        \ 'm:methods',
        \ 'f:fields:1'
    \ ]
\ }

let g:tagbar_type_ansible = {
	\ 'ctagstype' : 'ansible',
	\ 'kinds' : [
		\ 't:tasks'
	\ ],
	\ 'sort' : 0
\ }

let g:tagbar_type_make = {
            \ 'kinds':[
                \ 'm:macros',
                \ 't:targets'
            \ ]
\}

nmap <F8> :CtrlPMixed<CR>

" map F2 to Toggle between windows 
noremap <F2> <C-w><C-w>



" nmap cF :cs f f <C-R><C-F><CR>
" nmap cS :cs f s <C-R><C-W><CR>
" nmap cI :cs f i <C-R><C-W><CR>
" nmap cE :cs f e <C-R><C-W><CR>
" nmap cG :cs f g <C-R><C-W><CR>
" nmap cD :cs f d <C-R><C-W><CR>
" nmap cC :cs f c <C-R><C-W><CR>
" nmap cT :cs f t <C-R><C-W><CR>

"

" open NERDTree when starting vim
" autocmd vimenter * NERDTree

" change NERDTree window size
let g:NERDTreeWinSize=40

" not used 
" nnoremap <silent> <F8> :TlistOpen<CR>
" nnoremap <silent> <F9> :Gblame<CR>
" nnoremap gp :tabp<CR>
" :set tags=/root//opentas_ft.tags
" map <F4> :cs find c <C-r><C-w><CR>
" set csto=0
" map <F6> :cs find c <C-r><C-w><CR>


" set Background Color Erase to override color problems with tmux force
" xterm-256
set t_ut= 
