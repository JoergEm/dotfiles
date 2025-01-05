source /etc/vim/vimrc
syntax on
filetype plugin on
set mouse+=a
set background=dark
set visualbell
set noerrorbells
set autochdir
set tags=tags;
set cursorline
set cursorcolumn
set autochdir
set wrap
set shortmess+=I
set encoding=UTF-8
set guifont=FiraMono_Nerd_Font_Mono:h16:cANSI:qDRAFT
set laststatus=2
set backspace=indent,eol,start
set hidden
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
set showcmd
set autoindent
set smartindent
set cindent
set nofoldenable
set foldmethod=manual
set foldlevel=9
set foldnestmax=9
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set omnifunc=syntaxcomplete#Complete
" set scrollbind
let g:loaded_2html_plugin     = 1
let g:loaded_getscriptPlugin  = 1
let g:loaded_gzip             = 1
let g:loaded_logipat          = 1
let g:loaded_rrhelper         = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin        = 1
let g:loaded_vimballPlugin    = 1
let g:loaded_zipPlugin        = 1
let g:NERDTreeChDirMode=2
let g:gitgutter_git_executable = 'C:\Program Files\Git\cmd\git.exe'
let vimplug_exists=expand('~/.vim/autoload/plug.vim')
let g:vim_bootstrap_langs = "c#,r,java,elixir,html,javascript,lisp,ocaml,perl,python,scala,typescript"
let g:vim_bootstrap_editor = "vim"    " nvim or vim
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1
let cobol_legacy_code=1
if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif
call plug#begin(expand('~/.vim/plugged'))
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

Plug 'mhinz/vim-startify'
Plug 'editor-bootstrap/vim-bootstrap-updater'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'rhysd/git-messenger.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'romainl/apprentice'
Plug 'altercation/vim-colors-solarized', { 'as': 'solarized'}
Plug 'arcticicestudio/nord-vim', { 'as': 'nord'}
Plug 'nightsense/carbonized', { 'as': 'carbonized'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme', { 'as': 'papercolor' }
Plug 'srcery-colors/srcery-vim', { 'as': 'srcery' }
Plug 'chriskempson/base16-vim', { 'as': 'tomorrow' }
Plug 'ku1ik/vim-monokai', { 'as': 'monokai' }
Plug 'sainnhe/everforest', { 'as': 'everforest' }
Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }
Plug 'itchyny/calendar.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Python
Plug 'hynek/vim-python-pep8-indent'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'

"Flutter
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
":CocInstall coc-flutter
call plug#end()

if &term =~ "xterm\\|rxvt"
  let &t_SI = "\<Esc>]12;orange\x7"
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif
colorscheme gruvbox
hi CursorLine term=bold cterm=bold guibg=Grey40 gui=underline
hi CursorLineNr term=bold ctermfg=11 gui=bold guifg=green
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
autocmd BufEnter * silent! lcd %:p:h
autocmd BufWritePost $MYVIMRC source $MYVIMRC
"This unsets the last search pattern register by hitting return
nnoremap <silent><CR> :noh<CR><CR>
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
autocmd VimLeave * WipeReg
map <F2> :NERDTreeToggle %:p:h<CR>
map <F3> :set invnumber<CR>
map <F4> :set invrelativenumber<CR>
map <F5> :TagbarToggle<CR>
map <F6> :call DiffWithSaved()<CR>
map <F7> :DockerToolsToggle<CR>
map <F8> :call Kompiliere()<CR>
func! Kompiliere()
exec "w"
if &filetype == 'F90'
    exec "! gfortran %"
    exec "! ./a.out"
elseif &filetype == 'R'
    exec "! Rscript.exe %"
elseif &filetype == 'c'
    exec "! gcc % -o %< && ./%"
elseif &filetype == 'cbl'
    exec "! cobc -x %"
    exec "! ./%:r"
elseif &filetype == 'cpp'
    exec "! g++ -o %< %"
elseif &filetype == 'cs'
    exec "! dotnet run"
elseif &filetype == 'docker'
    exec "! docker build -t %:r ."
elseif &filetype == 'go'
    exec "! go run %"
elseif &filetype == 'html'
    exec "! open %"
elseif &filetype == 'java'
    exec "! javac %"
    exec "! java %:r"
elseif &filetype == 'jl'
    exec "! julia %"
elseif &filetype == 'kt'
    exec "! kotlinc % -include-runtime -d %:r.jar"
    exec "! java -jar %:r.jar"
elseif &filetype == 'py'
    exec "! python3 %"
elseif &filetype == 'rs'
    exec "! rustc %"
elseif &filetype == 'scala'
    exec "! scala %"
elseif &filetype == 'sh'
    exec "! bash %"
elseif &filetype == 'tex'
    exec "! latex %"
elseif &filetype == 'ts'
    exec "! node %"
endif
endfunc
" au BufRead * if search('\M-*- C++ -*-', 'n', 1) | setlocal ft=cpp | endif
function! DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
map <F9> :UndotreeToggle<CR>
map <F10> :Startify<CR>

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'
let g:startify_files_number = 8
let g:startify_lists = [
	        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
	        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
		\ { 'type': 'files',     'header': ['   Letzte Dateien ']},
		\ { 'type': 'dir',       'header': ['   Letzter Ordner ']},
		\ { 'type': 'sessions',  'header': ['   Sessions']},
		\ { 'type': 'commands',  'header': ['   Planung']},
		\ { 'type': 'bookmarks', 'header': ['   Lesezeichen']},
		\ ]
let g:startify_bookmarks = [
	\ { 'v': '~/.vimrc' },
	\ { 'z': '~/.zshrc'},
	\ ]
let g:startify_commands = [
	\ {'a': ['Tagesplanung', ':Calendar -view=day']},
	\ {'b': ['Wochenplanung', ':Calendar -view=week']},
	\ {'c': ['Monatsplanung', ':Calendar -view=month']},
	\ {'d': ['Kalender', ':Calendar -view=year']},
	\ {'u': ['Uhr', ':Calendar -view=clock']},
	\ {'n': ['Neue Notiz', ':Note']},
	\ ]
let NERDTreeHijackNetrw = 0
let s:footer =
           \ ['', "   Guten Tag Jörg ", '']
function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction
let g:startify_custom_footer = s:center(s:footer)

autocmd BufEnter * if line2byte('.') == -1 && len(tabpagebuflist()) == 1 && empty(bufname()) | Startify | endif

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline_left_sep = ''
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_sep = ''
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = '?'
  let g:airline#extensions#tabline#left_alt_sep = '?'

" powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

"let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_tab_type = 0

""
" NERDTree
""
" Open nerdtree window on opening Vim

au VimEnter * NERDTreeToggle /home/abraxas/Projekte | :NERDTree %:p:h | wincmd p

" Refresh the current folder if any changes
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

"Reload the window if directory is changed
augroup DIRCHANGE
    au!
    autocmd DirChanged global :NERDTreeCWD
augroup END

"Close nerdtree automatically if it is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '→→'
let g:NERDTreeDirArrowCollapsible = '↓'
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1
let NERDTreeIgnore = [
						\'\~$','\.pyc$','\*NTUSER*',
						\'\*ntuser*','\NTUSER.DAT',
						\'\ntuser.ini','\.DAT$',
						\'\.LOG1$','\.LOG1$',
						\'\.png$','\.jpg$','\.gif$',
						\'\.mp3$','\.flac$',
						\'\.ogg$','\.mp4$',
						\'\.avi$','\.webm$',
						\'\.mkv$','\.pdf$',
						\'\.zip$','\.tar.gz$',
						\'\.rar$']
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeFileLines = 1

augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkGoldenrod3', 'DarkOrchid3', 'DarkOrange3', 'SeaGreen3', 'FireBrick', 'LemonChiffon3']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta', 'Darkblue']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vorlagen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup templates
  autocmd!
  autocmd BufRead *.F90,*.R,*.c,*.cbl,*.cpp,*.cs,*.docker,*.go,*.html,*.java,*.jl,*.kt,*.py,*.rs,*.scala,*.tf,*.ts,*.tex call s:ApplyTemplate()
  function! s:ApplyTemplate()
    if getfsize(expand('%')) == 0
      execute "0r ~/.vim/templates/skeleton." . expand('%:e')
      execute "%s/__CLASS_NAME__/" . expand('%:t:r') . "/e"
      execute "%s/FILENAME/\\=expand('%:t:r')/g"
      execute "%s/DATUM/\\=strftime('%Y')/"
      execute "%s/INHABER/\\"
      execute "%s/START/\\=''"
    endif
  endfun
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufNewFile, BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

let python_highlight_all=1

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

command! PyReg
	\ call setreg('i', 'import', 'v') |
	\ call setreg('c', 'class', 'v')
set runtimepath^=~/.vim/bundle/vlime/vim

" devicons: reasonable defaults from webinstall.dev/vim-devicons
source ~/.vim/plugins/devicons.vim
