"*****************************************************************************
" @JoergEm
"*****************************************************************************

autocmd BufWritePost $MYVIMRC source $MYVIMRC

let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

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

"# curl -sS https://webi.sh/vim-devicons | sh; \
"# source ~/.config/envman/PATH.env
"# sudo apt install universal-ctags

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************

Plug 'mhinz/vim-startify'
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
"Plug 'ycm-core/YouCompleteMe'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"Assembler
"Plug 'iosmanthus/vim-nasm'

"Kotlin
Plug 'udalov/kotlin-vim'

"Python
Plug 'hynek/vim-python-pep8-indent'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'

" scala
if has('python')
    " sbt-vim
    Plug 'ktvoelker/sbt-vim'
endif
" vim-scala
Plug 'derekwyatt/vim-scala'

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call plug#end()

" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

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
set wrap
set shortmess+=I
set encoding=UTF-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set guifont=FiraMono_Nerd_Font_Mono:h16:cANSI:qDRAFT
set laststatus=2
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
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set backspace=indent,eol,start
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set omnifunc=syntaxcomplete#Complete
set complete+=i "autocomplete without comments
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
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
let g:gitgutter_git_executable = 'C:\Program Files\Git\cmd\git.exe'

"*****************************************************************************
"" Abbreviations
"*****************************************************************************

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

nnoremap n nzzzv
nnoremap N Nzzzv

"This unsets the last search pattern register by hitting return
nnoremap <silent><CR> :noh<CR><CR>

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Templates
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup templates
  autocmd!
  autocmd BufRead *.asm,*.f95,*.R,*.c,*.cbl,*.clj,*.cpp,*.cs,Dockerfile,*.erl,*.go,*.hs,*.html,*.java,*.jl,*.js,*.kt,*.nasm,*.pl,*.py,*.rs,*.scala,*.sql,*.tf,*.ts,*.tex call s:ApplyTemplate()

function! s:ApplyTemplate()
  if getfsize(expand('%')) == 0
    let l:extension = expand('%:e')
    if l:extension == ''
      let l:template = '~/.vim/templates/skeleton.Dockerfile'
    else
      let l:template = '~/.vim/templates/skeleton.' . l:extension
    endif
    execute "0r " . l:template
    let l:version = s:CallVersion()
    execute "%s/VERSION/" . l:version . "/ge"
    execute "%s/__CLASS_NAME__/" . expand('%:t:r') . "/e"
    execute "%s/FILENAME/\\=expand('%:t:r')/g"
    execute "%s/DATUM/\\=strftime('%Y')/"
    execute "%s/INHABER/\\Jörg M."
    execute "%s/START/\\=''"
    execute 'normal! zt'
    startinsert!
  endif
endfunction

function! s:CallVersion()
    let l:version = ''
    if &filetype == 'java'
        let l:version = system("java --version 2>&1 | head -n 1 | awk '{print $1, $2, $3, $4}'")
	elseif &filetype == 'asm'
        let l:version = system("nasm --version 2>&1")
	elseif &filetype == 'nasm'
        let l:version = system("nasm --version 2>&1")
	elseif &filetype == 'clojure'
        let l:version = system("clojure --version 2>&1 | head -n 1 | awk '{print $1, $4}'")		
    elseif index(['javascript', 'js'], &filetype) != -1
        let l:version = system("node --version 2>&1")
    elseif &filetype == 'perl'
        let l:version = system("perl -v 2>&1 | head -n 1 | awk '{print $1, $2, $3, $4, $5}'")
    elseif &filetype == 'python'
        let l:version = system("python3 --version 2>&1")
    elseif &filetype == 'cpp'
        let l:version = system("g++ --version 2>&1| head -n 1 | awk '{print $1, $2, $3, $4}'")
    elseif &filetype == 'go'
        let l:version = system("go version 2>&1 | head -n 1 | awk '{print $1, $2, $3}'")
    elseif &filetype == 'rust'
        let l:version = system("rustc --version 2>&1")
    elseif &filetype == 'scala'
        let l:version = system("scala -version 2>&1 | awk 'NR==2 {print $1, $4}'")
    elseif &filetype == 'erlang'
        let l:version = system("erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell 2>&1")
    elseif &filetype == 'haskell'
        let l:version = system("ghc --version 1>&1")
    elseif &filetype == 'html'
        let l:version = "HTML"
    elseif &filetype == 'sql'
        let l:version = system("mysql --version 2>&1 | head -n 1 | awk '{print $1, $2, $3}'")
    elseif &filetype == 'Dockerfile'
        let l:version = system("docker --version 2>&1")
    elseif &filetype == 'c'
        let l:version = system("gcc --version 2>&1| head -n 1 | awk '{print $1, $2, $3, $4}'")
    elseif &filetype == 'cobol'
        let l:version = system("cobc --version 2>&1 | head -n 1 | awk '{print $1, $2, $3}'")
    elseif &filetype == 'cs'
        let l:version = system("dotnet --version 2>&1")
    elseif &filetype == 'fortran'
        let l:version = system("gfortran --version 2>&1| head -n 1 | awk '{print $1, $2, $3, $4}'")
    elseif &filetype == 'julia'
        let l:version = system("julia --version 2>&1")
    elseif &filetype == 'kotlin'
        let l:version = system("kotlinc -version 2>&1")
    elseif &filetype == 'rs'
        let l:version = system("rustc --version 2>&1")
	elseif &filetype == 'r'
        let l:version = system("R --version 2>&1 | head -n 1 | awk '{print $1, $2, $3}'")
    elseif &filetype == 'tf'
        let l:version = system("terraform version 2>&1 | head -n 1 | cut -d ' ' -f 2")
    elseif index(['typescript', 'ts'], &filetype) != -1
        let l:version = system("tsc --version 2>&1")
    elseif index(['tex', 'plaintex'], &filetype) != -1
        let l:version = system("tex --version 2>&1 | head -n 1 | cut -d ' ' -f 2")
    else
        let l:version = "Filetype not available"
    endif
    let l:version = substitute(l:version, '\n', '', 'g')
    return l:version
endfunction


"*****************************************************************************
"" Visual Settings
"*****************************************************************************

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

" Set TagBar size
:let g:Tlist_WinWidth=20

"*****************************************************************************
"" Functions
"*****************************************************************************

func! Kompiliere()
exec "w"
if &filetype == 'asm'
exec "! nasm -f elf64 % -o %<.o"
exec "! ld %<.o -o %<"
exec "! ./%<"
elseif &filetype == 'nasm'
exec "! nasm -f elf64 % -o %<.o"
exec "! ld %<.o -o %<"
exec "! ./%<"
elseif &filetype =='clojure'
exec "! clojure -M %" 
elseif &filetype == 'fortran'
exec "! gfortran %"
exec "! ./a.out"
elseif &filetype == 'R'
exec "! Rscript.exe %"
elseif &filetype == 'c'
exec "! gcc % -o %< && ./%"
elseif &filetype == 'cobol'
exec "! cobc -x %"
exec "! ./%:r"
elseif &filetype == 'cpp'
exec "! g++ -o %< %"
elseif &filetype == 'cs'
exec "! dotnet run"
elseif &filetype == 'docker'
exec "! docker build -t %:r ."
elseif &filetype == 'erlang'
exec "! erlc %"
elseif &filetype == 'go'
exec "! go run %"
elseif &filetype == 'haskell'
exec "! ghc %"
elseif &filetype == 'html'
exec "! open %"
elseif &filetype == 'java'
exec "! javac %"
exec "! java %:r"
elseif &filetype == 'julia'
exec "! julia %"
elseif &filetype == 'javascript'
exec "! node %"
elseif &filetype == 'kotlin'
exec "! kotlinc % -include-runtime -d %:r.jar"
exec "! java -jar %:r.jar"
elseif &filetype == 'perl'
exec "! perl %"
" exec "chmod +x %"
" exec "./%"
elseif &filetype == 'python'
exec "! python3 %"
elseif &filetype == 'rust'
exec "! rustc %"
elseif &filetype == 'scala'
exec "! scala %"
elseif &filetype == 'shell'
exec "! bash %"
elseif &filetype == 'sql'
exec "! sudo mysql -u root -p < %"
elseif &filetype == 'latex'
exec "! latex %"
elseif &filetype == 'typescript'
exec "! tsc %"
else
echoerr 'Filetype unknown'
endif
endfunc

function! DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction


"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Commands
"*****************************************************************************

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" delete all entries in registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
autocmd VimLeave * WipeReg

map <F2> :NERDTreeToggle %:p:h<CR>
map <F3> :set invnumber<CR>
map <F4> :set invrelativenumber<CR>
map <F5> :TagbarToggle<CR>
map <F6> :call DiffWithSaved()<CR>
map <F7> :DockerToolsToggle<CR>
map <F8> :call Kompiliere()<CR>
map <F9> :UndotreeToggle<CR>
map <F10> :Startify<CR>

"*****************************************************************************
"" NERDTree
"*****************************************************************************

" Open nerdtree window on opening Vim

au VimEnter * NERDTreeToggle /home/abraxas/Projekte | :NERDTree %:p:h | wincmd p

" Set NerdTREE Size
:let g:NERDTreeWinSize=30

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

"*****************************************************************************
"" Startify
"*****************************************************************************


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
	\ { 's': '~/.vim/templates/' },
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Assembler
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_ignore_files = ['.*\.nasm', '.*\.asm']
let g:ale_pattern_options = {
\   '.*\.nasm$': {'ale_enabled': 0},
\   '.*\.asm$': {'ale_enabled': 0},
\}
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

highlight ColorColumn ctermbg=darkblue
call matchadd('ColorColumn', '\%81v', 100)

command! PyReg
	\ call setreg('i', 'import', 'v') |
	\ call setreg('c', 'class', 'v')
set runtimepath^=~/.vim/bundle/vlime/vim

"*****************************************************************************
"*****************************************************************************

" devicons: reasonable defaults from webinstall.dev/vim-devicons
source ~/.vim/plugins/devicons.vim

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
