set nocompatible

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plug auto-installation and setup {{{
    call plug#begin()

    " Bundles
        " Interface
            Plug 'itchyny/lightline.vim'
            Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
        " Colorschemes
            Plug 'joedicastro/vim-molokai256'
        " Editing
            Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
            Plug 'scrooloose/syntastic'
            Plug 'scrooloose/nerdcommenter'
            Plug 'bronson/vim-trailing-whitespace'
        " Syntax support
            Plug 'tpope/vim-markdown'
            Plug 'dag/vim-fish'
    call plug#end()
" }}}

filetype plugin indent on      " Indent and plugins by filetype


" VIM Setup {{{ ===============================================================
    let mapleader=','
    let maplocalleader= ' '
    "Basic
        set ttimeoutlen=0       " toggle between modes almost instantly
        set autoread            " automatically read file that has been changed on disk and doesn't have changes in vim
        set autowriteall        " Automatically save before commands like :next and :make
        set hidden              " enable multiple modified buffers
        set history=1000        " Store a lots of history commands
    " Backup
        set nobackup            " Don't create backups
        set noswapfile          " Don't create swap files
        set noundofile
    " Encoding
        set encoding=utf-8
        set termencoding=utf-8
        set fileencodings=utf8,cp1251
    " Interface
        set title               " Set title of the window to filename [+=-] (path) - VIM
        set showcmd             " Show (partial) command in status line.
        set scrolloff=5         " Minimal number of lines to keep above and below the cursor
        set ruler               " line and column number of the cursor position
        set laststatus=2        " always show the status line
        "set cursorline          " Highlight the screen line of the cursor
        set splitbelow          " Splitting a window will put the new window below the current one
        set splitright          " Splitting a window will put the new window right of the current one
        set backspace=indent,eol,start
        set noshowmode
    " Wildmenu
        set wildmenu                        " Command line autocompletion
        set wildmode=list:longest,full      " Shows all the options
        set wildignore+=*.sw?                            " Vim swap files
        set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
        set wildignore+=*.luac                           " Lua byte code
        set wildignore+=*.jar                            " java archives
        set wildignore+=*.pyc                            " Python byte code
        set wildignore+=*.stats                          " Pylint stats
    " Search
        set incsearch           " While typing a search command, show pattern matches as it is typed
        set hlsearch            " When there is a previous search pattern, highlight all its matches
        set ignorecase          " Ignore case in search patterns
        set smartcase           " Override the 'ignorecase' if the search pattern contains upper case characters
        set gdefault            " All matches in a line are substituted instead of one
    " Editor
        autocmd BufRead,BufNewFile *.md setlocal spell
        hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black
        "set showtabline=2       " Always show tabs
        set list                " Display invisible characters
        set listchars=tab:»·,trail:·
        set number              " Set line numbers
        set showmatch           " Show matching brackets.
        set nowrap              " Do not wrap words (view)
    " Tabs, Spaces
        set expandtab           " Use spaces instead of tab
        set shiftwidth=4        " Number of spaces to use for each step of (auto)indent
        set tabstop=4           " Number of spaces that a tab counts for
        set softtabstop=4       " Number of spaces that a tab counts for while performing editing operations
        set autoindent          " Copy indent from current line when starting a new line
        set smartindent         " Do smart indenting when starting a new line
        " File specific
            autocmd FileType ruby,coffee,haml,sass,yaml,scss setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
    " Colorscheme
        syntax enable
        set t_Co=256            " Number of colors
        set background=dark
        colorscheme molokai256
        let g:indent_guides_auto_colors = 0
        let &colorcolumn=join(range(140,999),",")
    " Resize the divisions if the Vim window size changes
        au VimResized * exe 'normal! \<c-w>='
" }}}

" Scortcuts {{{ ===============================================================
    " Edit {{{
        nmap \w :w!<CR>
    " }}}
    " Basic {{{
        " Clear the search highlight in Normal mode
        nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
        " FixWhitespaces
        map <F5> :FixWhitespace<CR>
    " }}}
    " Windows {{{
        " Fast windows moves
        nmap <C-h> <C-W>h
        nmap <C-j> <C-W>j
        nmap <C-k> <C-W>k
        nmap <C-l> <C-W>l
        " New windows
        nnoremap <Leader>v <C-w>v
        nnoremap <Leader>h <C-w>s
        " Create a new window relative to the current one
        nmap <Leader><left>  :leftabove  vnew<CR>
        nmap <Leader><right> :rightbelow vnew<CR>
        nmap <Leader><up>    :leftabove  new<CR>
        nmap <Leader><down>  :rightbelow new<CR>
        " Fast window & buffer close and kill
        nnoremap <Leader>k <C-w>c
        nnoremap <silent><Leader>K :bd<CR>
        " Fast switch between two last windows
        nnoremap <leader><leader> <c-^>
    " }}}
    " Cut/Paste {{{
        " toggle paste mode
        map <Leader>P :set invpaste<CR>
        if has('unix') && has ('mac')
            set clipboard=unnamed
        else
            set clipboard=unnamedplus
        endif
    " }}}
    " Spelling {{{
        " turn on the spell checking and set the English language
        nmap <Leader>se :setlocal spell spelllang=en<CR>
        " turn off the spell checking
        nmap <Leader>so :setlocal nospell <CR>
        " jump to the next bad spell word
        nmap <Leader>sn ]s
        " suggest words
        nmap <Leader>sp z=
        " jump to the next bad spell word and suggests a correct one
        nmap <Leader>sc ]sz=
        " add word to the dictionary
        nmap <Leader>sa zg
    " }}}
    " Search {{{
        " Search matches are always in center
        nmap n nzz
        nmap N Nzz
        nmap * *zz
        nmap # #zz
        nmap g* g*zz
        nmap g# g#zz
    " }}}
" }}}

" Plugins {{{=========================================================
    " Toggle line numbers {{{
        nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
        function! ToggleRelativeAbsoluteNumber()
          if !&number && !&relativenumber
              set number
              set norelativenumber
          elseif &number && !&relativenumber
              set nonumber
              set relativenumber
          elseif !&number && &relativenumber
              set number
              set relativenumber
          elseif &number && &relativenumber
              set nonumber
              set norelativenumber
          endif
        endfunction
    " }}}
    " YouCompleteMe {{{
        let g:ycm_complete_in_comments = 1
        let g:ycm_collect_identifiers_from_tags_files = 1
        let g:ycm_key_invoke_completion = '<C-Space>'
        let g:ycm_cache_omnifunc = 1
    " }}}
    " NerdTree {{{
        " Toggle NERDTree
        map <C-x> :NERDTreeToggle<CR>
        let NERDTreeShowBookmarks=1
        let NERDTreeChDirMode=2
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=0
        let NERDTreeMinimalUI=1
        let NERDTreeDirArrows=1
        let NERDTreeIgnore=['^\.idea$', '^\.git$', 'TAGS', '*.iml']
        let g:NERDTreeWinPos = "right""
    " }}}
    " Nerd Comment {{{
        nmap <leader>/ :call NERDComment(0, "invert")<cr>
        vmap <leader>/ :call NERDComment(0, "invert")<cr>
    " }}}
" }}}

"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"
