"
" HOWTO: Use Vim's folding to navigate.
"

" {{{ THANKS
" Tips and plugins from:
" ---------------------
" http://docs.python-guide.org/en/latest/dev/env/
" http://statico.github.io/vim2.html
" https://github.com/fisadev/fisa-vim-config.git
" http://nvie.com/posts/how-i-boosted-my-vim/
" https://github.com/mitsuhiko/dotfiles/blob/master/vim/vimrc
" https://raw.githubusercontent.com/nvie/vimrc/master/vimrc
" https://robots.thoughtbot.com/faster-grepping-in-vim
" https://github.com/Cloudef/dotfiles-ng/blob/master/#ARCHCONFIG/vim/vimrc"
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/ 
" https://github.com/almet/dotfiles/blob/master/.vimrc
" https://github.com/justinmayer/dotfiles/blob/master/vim/keys.vim
" ..and many others
" To all a BIG THANKS for making Vim a trickishly awesome IDE!
" }}}

" {{{ Plugins -- managed with Vundle
" ==========================================================================
"
" Vundle configuration (https://github.com/VundleVim/Vundle'
"
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Plugins go between vunlde#being and vundle#end
call vundle#begin()
"
" let Vundle manage Vundle
"""Plugin 'VundleVim/Vundle.vim'
" full URI doesn't seem to work so I'm disabling it
"""Plugin 'https://github.com/VundleVim/Vundle.vim' 

    " {{{ Autocompletion
        " {{{ Jedi
        " Better Python code completion than Rope
        """Plugin 'davidhalter/jedi-vim'
        Plugin 'https://github.com/davidhalter/jedi-vim' 
        " }}}
    " }}}

    " {{{ Python
        " {{{ Indentation
            " {{{ vim-python-pep8-indent
            """Plugin 'hynek/vim-python-pep8-indent'
            Plugin 'https://github.com/hynek/vim-python-pep8-indent'
            " }}}
        " }}}
    " }}}

    " {{{ Debugging
        " {{{ vdebug
        """Plugin 'joonty/vdebug'
        Plugin 'https://github.com/joonty/vdebug'
        " }}}
    " }}}

    " {{{ Files/Directories
        " {{{ nerdtree
        " Better file browser
        """Plugin 'scrooloose/nerdtree'
        Plugin 'https://github.com/scrooloose/nerdtree'
        " }}}
    " }}}

    " {{{ Comments
        " {{{ nerdcommenter
        " Code commenter
        """Plugin 'scrooloose/nerdcommenter'
        Plugin 'https://github.com/scrooloose/nerdcommenter'
        " }}}
    " }}}

    " {{{ Class/module browser
        " {{{ Tagbar
        """Plugin 'majutsushi/tagbar'
        Plugin 'https://github.com/majutsushi/tagbar'
        " }}}
    " }}}

    " {{{ Searching
        " {{{ Files/Buffers
            " {{{ Ctrl-P
            """ unmaintained "" Plugin 'kien/ctrlp.vim'
            """Plugin 'ctrlpvim/ctrlp.vim'
            Plugin 'https://github.com/ctrlpvim/ctrlp.vim'
            " }}}
            " {{{ """ not yet """ Find and Run Vim Commands
            "" Plugin 'fisadev/vim-ctrlp-cmdpalette'
            " }}}
        " }}}
        " {{{ Text
            " {{{ Ack
            Plugin 'https://github.com/mileszs/ack.vim' 
            " }}}
        " }}}
    " }}}

    " {{{ html/css
        " {{{ Emmet
        """Plugin 'mattn/emmet-vim'
        Plugin 'https://github.com/mattn/emmet-vim'
        " }}}
    " }}}

    " {{{ Status line
        " {{{ vim-airline:
        " Spice up status and tab lines
        """Plugin 'vim-airline/vim-airline'
        Plugin 'https://github.com/vim-airline/vim-airline'
        " }}}
        " {{{ Themes
            " {{{ Plugin 'vim-airline/vim-airline-themes'
            Plugin 'https://github.com/vim-airline/vim-airline-themes'
            " }}}
        " }}}
    " }}}

    " {{{ Parentheses
        " {{{ "" sometimes annoying "" vim-autoclose
        " Autoinsert closing brackets
        """Plugin 'Townk/vim-autoclose'
        """Plugin 'https://github.com/Townk/vim-autoclose'
        " }}}
    " }}}

    " {{{ Snippets
        " {{{ UltiSnips
        """Plugin 'SirVer/ultisnips'
        " Snippets manager (SnipMate), dependencies, and snippets repo
        Plugin 'https://github.com/SirVer/ultisnips'
        " }}}
        " {{{ Snippets repo as per UltiSnips readme
            " {{{ vim-snippets
            """Plugin 'honza/vim-snippets'
            Plugin 'https://github.com/honza/vim-snippets'
            " }}}
        " }}}
        " {{{ """Plugin 'garbas/vim-snipmate'
        """ vim-snippets readme recommends UltiSnips "" Plugin 'garbas/vim-snipmate'
        " }}}
    " }}}

    " {{{ Git/mercurial/others
    " {{{ Markers
            " {{{ S I G N I F Y
            """Plugin 'mhinz/vim-signify'
            " Note: Readme suggests vim-gitgutter for Git only...
            Plugin 'https://github.com/mhinz/vim-signify'
            " }}}
        " }}}
    " }}}

    " {{{ Code syntax checker
        " {{{ Syntastic
        """Plugin 'scrooloose/syntastic'
        Plugin 'https://github.com/scrooloose/syntastic'
        " }}}
    " }}}

    " {{{ Session management
        " {{{ vim-session
        " Save current session at exist and restore at restart
            " {{{ Dependencies
                " {{{ vim-misc
                """Plugin 'xolox/vim-misc'
                Plugin 'https://github.com/xolox/vim-misc'
                " }}}
            " }}}
        """ Plugin 'xolox/vim-session'
        Plugin 'https://github.com/xolox/vim-session'
        " }}}
    " }}}

    " {{{ Undo
        " {{{ Gundo
        """Plugin 'sjl/gundo.vim'
        Plugin 'https://github.com/sjl/gundo.vim'
        " }}}
    " }}}

    " {{{ Colors
        " {{{ "Plugin 'Wombat'
        "Plugin 'https://github.com/vim-scripts/Wombat'
        " }}}
        " {{{ Gvim only
            " {{{ "Plugin 'sjl/badwolf'
            "Plugin 'https://github.com/sjl/badwolf'
            " }}}
        " }}}
    " }}}

    " {{{ reStructuredText
        " {{{ Plugin 'Rykka/riv.vim'
        Plugin 'https://github.com/Rykka/riv.vim'
        call vundle#end()            " required
        filetype plugin indent on    " required
        " }}}
    " }}}

    " {{{ MoinMoin
    Plugin 'https://github.com/vim-scripts/moin.vim' 
    " }}}

    " {{{ YankRing
    Plugin 'https://github.com/vim-scripts/YankRing.vim'
    " }}}

    " {{{ ansible-vim
    Plugin 'https://github.com/pearofducks/ansible-vim'
    " }}}

" }}}

" {{{ Vim settings and mappings

" {{{ remaps
" {{{ remap leader to something more convenient
let mapleader = "\<space>"
" }}}
" {{{ carpal-less tunnel ESC
inoremap jf <ESC>
" }}}
" {{{ remap buffers navigation keys
" '^' is hard to reach when switching between buffers
nnoremap <C-@> :e #<CR>
nnoremap <C-N> :bn!<CR>
nnoremap <C-P> :bp!<CR>
" these are used for completion in insert mode
"inoremap <C-N> <ESC>:bn!<CR>
"inoremap <C-P> <ESC>:bp!<CR>
" }}}
" {{{ remap backtick
nnoremap ' `
nnoremap ` '
" }}}
" }}}

" {{{ tabs and spaces handling -- can be overriden by file type autocmds
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set formatoptions=taqw2
" }}}

" {{{ tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType markdown setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType markdown setlocal textwidth=0 formatoptions=cq
" }}}

" {{{ always show status bar
set laststatus=2
" }}}

" {{{ incremental search
set incsearch
" }}}

" {{{ highlight search results
set hlsearch
" clearing highlight with 'fajfafhaf;a'? better yet...thanks @nvie
nmap <silent> <Leader><space> :nohlsearch<CR>
" }}}

" {{{ enable syntax highlighting
syntax on
" }}}

" {{{ "old" autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>
" }}}

" {{{ (DISABLED) enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
""set completeopt-=preview
" }}}

" {{{ when scrolling, keep cursor 3 lines away from screen border
set scrolloff=4
" }}}

" {{{ when jumping keep cursor in the same column
set nostartofline
" }}}

" {{{ autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest
" }}}

" {{{ storage locations
   " {{{ swap files
   set directory=~/.vim/dirs/tmp//
    if !isdirectory(&directory)
        call mkdir(&directory, "p")
    endif
    " }}}
    " {{{ backup
    " make backup files
    set backup
    " where to save
    set backupdir=~/.vim/dirs/backups/
    if !isdirectory(&backupdir)
        call mkdir(&backupdir, "p")
    endif
    " }}}
    " {{{ undo
    " persistent undos
    set undofile
    set undodir=~/.vim/dirs/undos/
    if !isdirectory(&undodir)
        call mkdir(&undodir, "p")
    endif
    " }}}
    " {{{ viminfo
    set viminfo+=n~/.vim/dirs/viminfo
    " }}}
" }}}

" {{{ paragraphs formatting
" redefine list pattern
"   - don't include "\d "
"   - also formats reST lines starting with "#."
set formatlistpat=^\\s*\\([0-9#]\\+[.]\\)\\+\\s*
" I have autoindent on most of the time (also lines '-' do not get formatted 
" when this is not enabled
set autoindent
" }}}

" {{{ """ not using tabs anymore """ open max this many tabs
" set tabpagemax=50
" }}}

" {{{ :help 'backspace'
set backspace=indent,eol,start
" }}}

" {{{ readline <Del> "
imap <C-d> <Del>
" }}}

" {{{ keep formatting when pasting "
set pastetoggle=<F9>
" }}}

" {{{ blank lines
    " {{{ easy insert in normal mode
    nnoremap - O<ESC>j
    nnoremap + o<ESC>j
    " }}}
    " {{{ no spaces on empty lines
    nnoremap <leader>. :%s/^\s\+$//g<CR>''
    " }}}
" }}}

" {{{ mail
" {{{ ignore case on searches
autocmd FileType mail setlocal ignorecase
" }}}
" {{{ reformat quickly
map <F8> magggwG'a:%s/^ > /> /g<CR>'a
" }}}
" {{{ email signature
source ~/.vimrc-email-sig
" email signature }}}
" mail }}}

" {{{ more comfortable window navigation keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}

" {{{ when resizing editor window also resize vim windows
autocmd VimResized * :wincmd =
" }}}

" {{{ languages

" {{{ Python
" highlight special characters
autocmd FileType python setlocal list
autocmd FileType python setlocal listchars=tab:>~,trail:~,extends:#,nbsp:~
" show line numbers when coding
autocmd FileType python setlocal number
" format and indent the "usual" way
autocmd FileType python setlocal formatoptions=taqw2 foldmethod=indent
" }}}

" {{{ reStructuredText
" highlight special characters
autocmd FileType rst setlocal list
autocmd FileType rst setlocal listchars=tab:>~,trail:~,extends:#,nbsp:~
" format the "usual" way
autocmd FileType rst setlocal formatoptions=taqw2
" }}}

" {{{ Vim script
" show line numbers when coding
autocmd FileType vim setlocal number
" format the "usual" way
autocmd FileType vim setlocal formatoptions=taqw2
" use markers for folding
autocmd FileType vim setlocal foldmethod=marker
" }}}

" languages }}}

" {{{ display tweaks
" airline takes care of displaying the mode on status bar
set noshowmode
" display Help in the right hand vertical window
""" see ~/.vim/after/ftplugin/help.vim
" }}}

" {{{ (DISABLED) highlight the cursor position
"set cursorline
" }}}

" {{{ highlight one column after textwidth
set colorcolumn=+1
set background=light
colorscheme peachpuff
" }}}

" {{{ 'ag' for embedded grep
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif 
"}}}

" {{{ default fold method
set foldmethod=marker
" }}}

" {{{ Sphinx
nnoremap <leader>h :!make html<CR>
" }}}

" Vim settings and mappings }}}

" {{{ Plugins settings and mappings

" {{{ Jedi
let g:jedi#show_call_signatures = "1"
"> Jedi documentation says:
"> NOTE: subject to change!
"> so let's define them here
let g:jedi#goto_command = "<leader>j"
let g:jedi#goto_assignments_command = "<leader>k"
let g:jedi#goto_definitions_command = "<leader>l"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>;"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>jr"
" on large modules autocomplete popup is slow(er)
let g:jedi#popup_on_dot = 0 
" }}}

" {{{ Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" }}}

" {{{ Tagbar
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1
" }}}

" {{{ NERDTree
" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
""nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', 'pip-log\.txt$', '\.o$' ]
" }}}

" {{{ nerdcommenter
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" }}}

" {{{ CtrlP
" file finder mapping
let g:ctrlp_map = '<Leader>~'
" search buffers by name
nmap <leader>f :CtrlPBuffer<CR>
" changes in (all) buffers
nmap <leader>v :CtrlPChange<CR>
nmap <leader>c :CtrlPChangeAll<CR>
" Search lines with word in current buffer -- replacement for '/'
nmap <leader>s :CtrlPLine<CR>
" search tags in current buffer / all active buffers
" Requires |exuberant_ctags| or compatible programs.
nmap <leader>e :CtrlPBufTagAll<CR>
nmap <leader>w :CtrlPBufTag<CR>
" Open CtrlP in find file mode.
nmap <leader>a :CtrlP<CR>
" Search by name all files, buffers and MRU files at the same time.
nmap <leader>d :CtrlPMRUFiles<CR>
" Search for a tag within a generated central tags file, and jump to the 
" definition. Use the Vim's option |'tags'| to specify the names and the 
" locations of the tags file(s).
nmap <leader>t :CtrlPTag<CR>
" Search for a tag within the current buffer or all listed buffers and jump to 
" Open CtrlP in find Most-Recently-Used file mode.
nmap <leader>m :CtrlPMixed<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" same as previous mappings, but calling with current word as default text
"nmap <leader>wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
"nmap <leader>wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
"nmap <leader>wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
"nmap <leader>we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
"nmap <leader>pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
"nmap <leader>wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
"nmap <leader>wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }
" The Silver Searcher
if executable('ag')
  " ag for listing files -- lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -l --nocolor ".*" %s'
  " ag is fast but with cache it's instant and F5 is not far
  let g:ctrlp_use_caching = 1
endif 
" Can be toggled on/off by pressing <c-r> inside the prompt.
let g:ctrlp_regexp = 1
" follow symlinks
let g:ctrlp_follow_symlinks = 1
" increased height for preview window
let g:ctrlp_match_window = 'max:30'
" }}}

" {{{ Ack
nmap \ :Ack<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif 
" }}}

" {{{ Syntastic
" show list of errors and warnings on the current file
nmap <leader>r :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" signal error in the sidebar -- overwrite signify until fixed
let g:syntastic_enable_signs = 1
" statusline (see also airline)
set statusline+=%#warningmsg#
"""set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_wq = 0
" I like pylint to scream at me
let g:syntastic_python_checkers = ["python", "pylint", "flake8" ]
let g:syntastic_ignore_files = ['\m\c\.rst$']
" }}}

" {{{ UltiSnips
" Trigger configuration. Do not use <tab> if you use 
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}

" {{{ Autoclose
"> https://github.com/Townk/vim-autoclose/issues/28
imap <C-H> <BS>
" }}}

" {{{ Signify
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap ]h <plug>(signify-next-hunk)
nmap [h <plug>(signify-prev-hunk)
" don't auto save - in insert mode is resets cursor position under the last 
" character; it also slows down during periodic saves
"let g:signify_cursorhold_normal = 1
"let g:signify_cursorhold_insert = 1
" non intrusive highlight signs colors for 'slate' colorscheme
autocmd VimEnter * :highlight SignifySignAdd    cterm=bold ctermbg=NONE  ctermfg=gray
autocmd VimEnter * :highlight SignifySignDelete cterm=bold ctermbg=NONE  ctermfg=gray
autocmd VimEnter * :highlight SignifySignChange cterm=bold ctermbg=NONE  ctermfg=gray
" }}}

" {{{ Airline
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
" syntastic populates the location list, however airline dynamically adjusts
let g:airline#extensions#syntastic#enabled = 1
" }}}

" {{{ Gundo
nnoremap <Leader>g :GundoToggle<CR>
let g:gundo_preview_bottom=1
" }}}

" {{{ vim-session
" Don't save hidden and unloaded buffers in sessions.
set sessionoptions-=buffers
let g:session_autosave='yes'
let g:session_autoload = 'no' 
nnoremap <Leader>R :RestartVim<CR>
" }}}

" {{{ YankRing
" store yankring history here:
let g:yankring_history_dir = '~/.vim/dirs/'
" do not store single letters
let g:yankring_min_element_length = 2
" what you yanked is what you get
let g:yankring_max_element_length = 0
nnoremap <Leader>" :YRShow<CR>
" '/ ?' steal incsearch
let g:yankring_zap_keys = 'f t'
" see YRReplace help -- but I don't need those
let g:yankring_replace_n_pkey = '<C-.>'
let g:yankring_replace_n_nkey = '<C-.>'
" }}}

" Plugins settings and mappings }}}

