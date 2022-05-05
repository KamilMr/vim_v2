let mapleader = ","
set nu
set relativenumber
set hidden
set scrolloff=8
set signcolumn=yes
set cc=80
set guifont=Monospace:h12
colorscheme gruvbox
set bg=dark
:set backupcopy=yes
" set cursorcolumn " highlight the screen column of the cursor
set nomodeline

" set statusline=%F[%L][%{&ff}]%y[%04l,%04v]

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gs :G<CR>
nmap <Leader>r :e ~/bin/<CR>
nmap <Leader>e :e ~/.vimrc<CR>
nmap <Leader>gf :diffget //2<CR>
nmap <Leader>gj :diffget //3<CR>
imap cl console.log();<Esc>==f(a
imap cc // <Esc>i<space>
imap cct // TODO: <Esc>i
imap ccb /**/ <Esc>F*i
imap cnf const = () => {};<Esc>Ftli
imap caf () => {};<Esc>F)i
nnoremap <silent> <Leader>gf :lnext<CR>

nnoremap <Leader>t :term<CR>
nnoremap <silent> <Leader>fuk :!npmC.sh -r %<CR>
nnoremap <silent> <Leader>gp :Git -c push.default=current push<CR>
nnoremap <Leader>ss :setlocal spell!<CR>

nnoremap <silent> <Leader>xxx :!cpvimrc.sh<CR>

 let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
 let g:vim_jsx_pretty_colorful_config = 1 " default 0
 let g:vim_jsx_pretty_highlight_close_tag = 1


 "NERDTree""""""""""""
 nnoremap <leader>n :NERDTreeFocus<CR>
 nnoremap <C-n> :NERDTree<CR>
 nnoremap <C-t> :NERDTreeToggle<CR>
 let g:NERDTreeWinPos = "right"

""""""""""""""""""""""""""config""""""""""""""""""
"
"           https://github.com/amix/vimrc
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignore compiled files //

"Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Height of the command bar
set cmdheight=1


" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" center cursor
augroup VCenterCursor
    au!
      au BufEnter,WinEnter,WinNew,VimResized *,*.*
              \ let &scrolloff=winheight(win_getid())/2
    augroup END

