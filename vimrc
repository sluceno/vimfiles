" vimrc
" Author: Codegram
" Source: https://github.com/codegram/vimfiles

set nocompatible

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
call vundle#rc()
Bundle 'gmarik/vundle'

" ----------
" Leader key
" ----------
let mapleader = "'"
let maplocalleader = "."

" -------
" BUNDLES
" -------
"
Bundle 'rking/ag.vim'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-surround'
Bundle 'Townk/vim-autoclose'
Bundle 'jmartindf/vim-tcomment'
Bundle 'kien/ctrlp.vim'

Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-fireplace'

Bundle 'ervandew/supertab'

Bundle 'junkblocker/patchreview-vim'
Bundle 'codegram/vim-codereview'

Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'rking/vim-ruby-refactoring'
Bundle 'tpope/vim-dispatch'
Bundle 'airblade/vim-gitgutter'

Bundle 'nono/vim-handlebars'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'

Bundle 'slim-template/vim-slim'
Bundle 'vim-scripts/ctags.vim'
Bundle 'mrxd/bufkill.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/syntastic'

Bundle 'codegram/vim-haml2slim'
Bundle 'majutsushi/tagbar'

Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

" Default color theme
Bundle 'sjl/badwolf'
Bundle 'Lokaltog/powerline'
colorscheme badwolf

Bundle 'wting/rust.vim'

Bundle 'terryma/vim-multiple-cursors'

Plugin 'fatih/vim-go'
" ------------
" VIM SETTINGS
" ------------

set autoindent
set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=menuone,preview
set expandtab
set foldcolumn=0
set foldlevel=9
set foldmethod=indent
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set gdefault
set laststatus=2
set list
set listchars=trail:·
set modelines=5
set nobackup
set noeol
set nofoldenable
set noswapfile
set number
set numberwidth=4
set ruler
set shell=/bin/bash
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set tabstop=2
set softtabstop=2
set title
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set textwidth=78
set wildignore+=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.gitkeep,.DS_Store
set textwidth=79
set formatoptions=n
set colorcolumn=79
set tw=79
set t_Co=256
set re=1
set tags+=tags,.tags
let g:go_fmt_command = "goimports"
"set clipboard=unnamed

if has("gui_running")
    set guioptions-=T " no toolbar
    set guioptions-=m " no menus
    set guioptions-=r " no scrollbar on the right
    set guioptions-=R " no scrollbar on the right
    set guioptions-=l " no scrollbar on the left
    set guioptions-=b " no scrollbar on the bottom
    set guioptions=aiA
    set mouse=v
endif
set guifont=Monaco\ for\ Powerline
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" Autocommands depending on file type
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et
autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace

" --------
" MAPPINGS
" --------

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

" imap jk <ESC>
nnoremap ; :

" Search
nmap <Space> /
nnoremap / /\v
vnoremap / /\v

" Clear search
nnoremap <leader><space> :noh<cr>

" Saving and buffer stuff
" nmap <leader><ESC> :q!<CR>
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>

" Switch between / delete buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
nmap <leader>d :bd<CR>
nmap <leader>D :bufdo bd<CR>

" Splits
nnoremap <leader>v :vs<CR> <C-w>l
nnoremap <leader>h :sp<CR> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Paste mode
set pastetoggle=<F2>

" Git blame
vmap <leader>gb :Gblame<CR>

" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

function! DeleteFile()
    let file_to_delete = expand('%')
    let deletion_confirmation = input('Are you sure you want to delete "'.file_to_delete. '"? ')
    if deletion_confirmation == 'y' || deletion_confirmation == 'Y'
        exec ':call delete("'.file_to_delete.'")'
        redraw!
        echo 'Deleted successfully!'
    else
      redraw!
    endif
endfunction
map <leader>rm :call DeleteFile()<cr>

"--------------
" RUNNING TESTS
"--------------
function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature') != -1
      exec ":!bundle exec spinach " . a:filename
    else
      if filereadable("script/test")
        exec ":!script/test " . a:filename
      elseif match(a:filename, '_test\.rb') != -1
        exec ":!ruby -I'lib:test' " . a:filename
      elseif match(a:filename, '_spec\.rb') != -1
        exec ":!rspec --color --drb " . a:filename
      end
    end
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')

    call RunTestFile(":" . spec_line_number)
endfunction

map <leader>t :call RunTestFile()<CR>
map <leader>T :call RunNearestTest()<CR>

" ----------------
" PLUG-IN SETTINGS
" ----------------

" Ag (Regex-based search)
nmap <leader>a :Ag
" Rotating among results
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Fugitive (Git)
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>

" TComment
map <Leader>co :TComment<CR>

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" Ctags
" You can use Ctrl-] to jump to a function.... Ctrl-p will jump back
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" map <C-p> :pop<CR>

" You can cycle through multiple function definitions using
" these mappings. This maps to my windows key + left/right arrows
map <F7> :tnext<CR>
map <F9> :tprev<CR>

" " NERDtree
nmap <silent> <leader>p :NERDTreeToggle<cr>%
" Surround
" ,' switches ' and "
nnoremap <leader>' ""yls<c-r>={'"': "'", "'": '"'}[@"]<cr><esc>

" Syntastic
let g:syntastic_check_on_open=0
let g:syntastic_echo_current_error=0
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=0

" Haml2Slim
nnoremap <leader>h2s :call Haml2Slim(bufname("%"))<CR>

" --------------------
" CUSTOM CONFIGURATION
" --------------------
let my_home = expand("$HOME/")
if filereadable(my_home . '.vimrc.local')
  source ~/.vimrc.local
endif

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
let g:clojure_align_multiline_strings = 1

colorscheme badwolf

nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk

syntax on
filetype indent plugin on

" Vim Gist
let g:gist_clip_command = 'pbcopy'
" let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" Vim dispatch
autocmd FileType ruby
      \ if expand('%') =~# '_test\.rb$' |
      \   compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
      \ elseif expand('%') =~# '_spec\.rb$' |
      \   compiler rspec | setl makeprg=bundle\ exec\ rspec\ \"%:p\" |
      \ else |
      \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
      \ endif

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>r :call RunAllSpecs()<CR>

if executable("spring")
  let g:rspec_command = "!bundle exec spring rspec {spec}"
endif

if executable("zeus")
  let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
endif

nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Ctrlp.vim
let g:ctrlp_map = '<leader>o'
let g:ctrlp_working_path_mode = 'ra'
map <leader>c :CtrlPTag<cr>

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
