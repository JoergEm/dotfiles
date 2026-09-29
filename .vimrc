"*****************************************************************************
"* @JoergEm
"*****************************************************************************
"* Kommentare beginnen mit `"`
"
"
"* Inhaltsverzeichnis, Inhalte werden mit `#` aufgerufen
"  zurück zum Inhaltsverzeichnis mit `Strg + o`

" *InhaltsverzeichnisPlugPakete*
" *InhaltsverzeichnisStandardEinstellungen*
" *InhaltsverzeichnisAbkürzungen*
" *InhaltsverzeichnisVorlagen*
" *InhaltsverzeichnisVisuelleEinstellungen*
" *InhaltsverzeichnisFunktionen*
" *InhaltsverzeichnisAutomatischeRegeln*
" *InhaltsverzeichnisBefehle*
" *InhaltsverzeichnisPlugEinstellungen*
" *InhaltsverzeichnisNERDTree*
" *InhaltsverzeichnisStartify*
" *InhaltsverzeichnisEinstellungenSprachen*
" *InhaltsverzeichnisSonstiges*
"
"
"



" Veränderungen der Konfigurationsdatei werden sofort angewiesen
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
"* Plug Pakete
"*****************************************************************************
" *InhaltsverzeichnisPlugPakete*

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
"Debugger
Plug 'puremourning/vimspector'
Plug 'dart-lang/dart-vim-plugin'

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
"* Standard Einstellungen
"*****************************************************************************
" *InhaltsverzeichnisStandardEinstellungen*

source /etc/vim/vimrc
" Lädt die systemweite Standard-Vim-Konfiguration aus /etc/vim/vimrc

filetype plugin on
" Aktiviert das automatische Erkennen von Dateitypen und lädt passende Plugins

syntax on
" Schaltet Syntaxhervorhebung ein

set synmaxcol=400
" Beschränkt die Syntaxhervorhebung auf die ersten 400 Spalten einer Zeile

set mouse+=a
" Ermöglicht Mauskontrolle in allen Modi 

set background=dark
" Setzt das Farbschema auf ein dunkles Hintergrundtheme

set visualbell
" Verwendet einen visuellen Alarm 

set noerrorbells
" Deaktiviert akustische Fehler-Benachrichtigungen

set autochdir
" Wechselt das Arbeitsverzeichnis automatisch zum Verzeichnis der geöffneten Datei

set tags=tags;
" Sucht nach einer Datei namens 'tags' (für Code-Navigation) im aktuellen Verzeichnis

set cursorline
" Hebt die Zeile hervor, in der sich der Cursor befindet

set cursorcolumn
" Hebt die Spalte hervor, in der sich der Cursor befindet

set wrap
" Aktiviert das Zeilenumbruchverhalten, lange Zeilen werden umgebrochen und passen sich ans Fenster an

" Fügt ein virtuelles Zeichen am Ende an ($ -> $1)
" set virtualedit=onemore

set shortmess+=I
" Unterdrückt die Einführungsnachricht beim Start von Vim 

set encoding=UTF-8
" Setzt die interne Zeichenkodierung von Vim auf UTF-8

set fileencoding=utf-8
" Standard-Datei-Zeichenkodierung beim Speichern auf UTF-8 setzen

set fileencodings=utf-8
" Liste der zu versuchenden Datei-Zeichenkodierungen beim Öffnen, hier nur UTF-8

set ttyfast
" Optimiert die Bildschirmaktualisierung für schnelle Terminals 

set guifont=FiraMono_Nerd_Font_Mono:h16:cANSI:qDRAFT
" Setzt die Schriftart fest

set laststatus=2
" Zeigt immer die Statuszeile an

set hidden
" Erlaubt das Wechseln zwischen Puffern ohne Speichern

set ignorecase
" Sucht standardmäßig ohne Berücksichtigung der Groß- und Kleinschreibung

set smartcase
" Überschreibt ignorecase, wenn in der Suche Großbuchstaben verwendet werden

set incsearch
" Zeigt während der Suche bereits das Suchergebnis inkrementell an

set hlsearch
" Hebt alle Suchergebnisse farblich hervor

set showmatch
" Zeigt kurz die passende Klammer, wenn eine Klammer eingegeben wird

set showcmd
" Zeigt den aktuell eingegebenen Befehl unten rechts an

set autoindent
" Übernimmt beim Zeilenumbruch die Einrückung der vorherigen Zeile automatisch

set smartindent
" Passt die Einrückung beim Programmieren automatisch an den Fluss an

set cindent
" Aktiviert C-Stil Einrückungen

set nofoldenable
" Deaktiviert die Faltung standardmäßig

set foldmethod=marker
" Faltet Codeabschnitte anhand spezieller Marker

set foldlevel=9
" Beim Öffnen sind Faltungen bis Tiefe 9 standardmäßig geöffnet

set foldnestmax=9
" Maximal erlaubte Verschachtelungstiefe von Faltungen ist 9

set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
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
" Keep the current directory and the browsing directory synced. 
" This helps you avoid the move files error.
let g:netrw_keepdir = 0
" Hide the banner (if you want). To show it temporarily you can use I inside Netrw.
let g:netrw_banner = 0


"*****************************************************************************
"* Abkürzungen
"*****************************************************************************
" *InhaltsverzeichnisAbkürzungen*

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

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

" Linter nur nach dem Schreiben aufrufen, nicht beim Tippen
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1

"*****************************************************************************
"* Vorlagen
"*****************************************************************************
" *InhaltsverzeichnisVorlagen*

augroup templates
  autocmd!
  autocmd BufRead *.asm,*.f95,*.R,*.c,*.cbl,*.clj,*.cpp,*.cs,*.dart,Dockerfile,*.erl,*.go,*.hs,*.html,*.java,*.jl,*.js,*.kt,*.nasm,*.pl,*.py,*.rs,*.scala,*.sql,*.tf,*.ts,*.tex call s:ApplyTemplate()

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
    if g:NERDTree.IsOpen()
        execute "NERDTreeClose"
    endif
    execute "%s/VERSION/" . l:version . "/ge"
    execute "%s/__CLASS_NAME__/" . expand('%:t:r') . "/e"
    execute "%s/FILENAME/\\=expand('%:t:r')/g"
    execute "%s/DATUM/\\=strftime('%Y')/"
    execute "%s/INHABER/\\Jörg Mekka"
    execute "%s/START/\\=''"
	call timer_start(50, { -> execute('normal! zt') })
	call timer_start(100, { -> feedkeys("i", "n") })
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
    elseif &filetype == 'dart'
        let l:version = system("dart --version 2>&1 | head -n 1 | awk '{print $1, $2, $3, $4}'")
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

augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType asm,nasm,clj 	let b:comment_leader = ';; ' 
  autocmd FileType cbl				let b:comment_leader = '*> ' 
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType cs,dart,fsharp	let b:comment_leader = '// '
  autocmd FileType javascript,rust	let b:comment_leader = '// '
  autocmd FileType typescript		let b:comment_leader = '// '
  autocmd FileType go,kotlin		let b:comment_leader = '// '
  autocmd FileType sh,ruby,python,R let b:comment_leader = '# '
  autocmd FileType conf,fstab,julia let b:comment_leader = '# '
  autocmd FileType tex,matlab       let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
  autocmd FileType erlang           let b:comment_leader = '%% '
  autocmd FileType hs,sql			let b:comment_leader = '-- '
  autocmd FileType fortran          let b:comment_leader = '! '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


"*****************************************************************************
"" Visuelle Einstellungen
"*****************************************************************************
" *InhaltsverzeichnisVisuelleEinstellungen*

colorscheme gruvbox

if &term =~ "xterm\\|rxvt"

  " Cursor Farben steuern
  let &t_SI = "\<Esc>]12;orange\x7" " Insert mode
  let &t_EI = "\<Esc>]12;red\x7"    " Normal mode

  " Cursorform steuern (0 q: Blinkt, 2 q: Fester Block, 4 q: Unterstrich 6 q: Seitenstrich)
  let &t_SI .= "\<Esc>[0 q" " Insert mode
  let &t_EI .= "\<Esc>[3 q" " Normal mode

  " Anfangszustand
  silent !echo -ne "\033]12;red\007\033[3 q"

  " Cursorfarbe und -form beim finalen Verlassen von Vim zurücksetzen
  autocmd VimLeavePre * silent !echo -ne "\033]112\007\033[0 q"
endif

hi CursorLine term=bold cterm=bold guibg=Grey40 gui=underline
hi CursorLineNr term=bold ctermfg=11 gui=bold guifg=green
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" Set TagBar size
:let g:Tlist_WinWidth=20

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"*****************************************************************************
"* Funktionen
"*****************************************************************************
" *InhaltsverzeichnisFunktionen*

func! Kompiliere()
write
if &filetype == 'asm' || &filetype ==# 'nasm'
exec "! nasm -f elf64 % -o %<.o"
exec "! ld %<.o -o %<"
exec "! ./%<"
elseif &filetype =='clojure'
exec "! clojure -M %" 
elseif &filetype == 'fortran'
exec "! gfortran %"
exec "! ./a.out"
elseif &filetype == 'R'
exec "! Rscript %"
elseif &filetype == 'c'
exec "! gcc % -o %< && ./%:r"
elseif &filetype == 'cobol'
exec "! cobc -x %"
exec "! ./%:r"
elseif &filetype == 'cpp'
exec "! g++ -o %< %"
exec "! ./%:r"
elseif &filetype == 'cs'
exec "! dotnet run"
elseif &filetype == 'dart'
exec "! dart run %"
elseif &filetype == 'docker'
exec "! docker build -t %:r ."
elseif &filetype == 'erlang'
exec "! erlc %"
elseif &filetype == 'fsharp'
exec "! dotnet run"
elseif &filetype == 'go'
exec "! go run %"
elseif &filetype == 'haskell'
exec "! ghc %"
exec "! ./%:r"
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
exec "edit " . expand("%:r") . ".js"
else
echoerr 'Filetype unknown'
endif
endfunc

function! DiffWithSaved()
  " Aktuellen Dateityp merken
  let filetype = &filetype

  " Diff-Modus im aktuellen Fenster aktivieren
  diffthis

  " Neues vertikales Fenster öffnen und gespeicherten Stand laden
  vnew | r #

  " Leere erste Zeile entfernen (von :r erzeugt)
  normal! ggdd

  " Puffer als temporär/nicht editierbar markieren
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal nobuflisted
  setlocal noswapfile
  setlocal readonly
  setlocal filetype=<filetype>

  " Diff-Modus auch im neuen Fenster aktivieren
  diffthis

  " Scroll-Synchronisation und Zeilennummern in diesem Fenster aktivieren
  setlocal number scrollbind

  " Zurück ins Originalfenster und dort ebenfalls aktivieren
  wincmd p
  setlocal number scrollbind
endfunction


function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! GitLog()
    let l:git_log = system("git log -n 1 -L " . line(".") . ",+1:" . expand("%:p"))
    call setbufvar(winbufnr(popup_atcursor(split(l:git_log, "\n"), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")
endfunction

function! GitCommitPush()
    write
    let l:commit_message = input('Enter commit message: ')
    silent! execute '!git add %'
    silent! execute '!git commit -m "' . l:commit_message . '"'
    silent! execute '!git push'
    redraw!
endfunction

let s:tags = ['', '[Init]', '[Feat]', '[Fix]', '[Docs]', '[Refactor]', '[Test]', '[Add]', '[Style]']

function! s:TagChosen(id, result) abort
    " result: -1 = Escape, 0 = Enter ohne Auswahl, >= 1 = gewählter Index (1-basiert)
    if a:result <= 0
        echo "Commit aborted"
        return
    endif
    let l:tag = s:tags[a:result - 1]
    let l:msg = input('Enter commit message: ')
    if empty(l:msg)
        echo "\nCommit aborted"
        return
    endif
    let l:tag = s:tags[a:result - 1]
	let l:commit_message = empty(l:tag) ? l:msg : l:tag . ' ' . l:msg
    write
    silent! execute '!git add %'
    silent! execute '!git commit -m "' . l:commit_message . '"'
    silent! execute '!git push'
    redraw!
    echo "Committed: " . l:commit_message
endfunction

function! GitCommitPop()
    call popup_menu(s:tags, {
        \ 'title':    ' Select commit tag ',
        \ 'border':   [],
        \ 'padding':  [0, 1, 0, 1],
        \ 'callback': function('s:TagChosen')
        \ })
endfunction

command! GitCommitPop call GitCommitPop()

function! InsertDocstring()
    let l:ft = &filetype

    if l:ft ==# 'python'
        let l:start_comment = '"""'
        let l:end_comment   = '"""'
        let l:line_prefix   = ''
    elseif l:ft =~# 'javascript\|typescript\|java\|kotlin\|c\|cpp\|cs\|css\|sass\|sql\|php\|dart\|vhdl'
        let l:start_comment = '/*'
        let l:end_comment   = '*/'
        let l:line_prefix   = ' * '
    elseif l:ft =~# 'scala'
        let l:start_comment = '/**'
        let l:end_comment   = '*/'
        let l:line_prefix   = ' * '
    elseif l:ft ==# 'nasm\|asm'
        let l:start_comment = '%ifdef COMMENT'
        let l:end_comment   = '%endif'
        let l:line_prefix   = ';; '
    elseif l:ft ==# 'erlang'
        let l:start_comment = '-ifdef(COMMENT).'
        let l:end_comment   = '-endif.'
        let l:line_prefix   = '% '
    elseif l:ft ==# 'clojure'
        let l:start_comment = ';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;'
        let l:end_comment   = ';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;'
        let l:line_prefix   = ';; '
    elseif l:ft ==# 'cobol'
        let l:start_comment = '*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
        let l:end_comment   = '*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
        let l:line_prefix   = '*> '
    elseif l:ft ==# 'cuda\|qsharp'
        let l:start_comment = '///////////////////////////////////////////////'
        let l:end_comment   = '///////////////////////////////////////////////'
        let l:line_prefix   = '// '
    elseif l:ft ==# 'fsharp\|wolfram'
        let l:start_comment = '(*'
        let l:end_comment   = '*)'
        let l:line_prefix   = ''
    elseif l:ft ==# 'ocaml'
        let l:start_comment = '(**'
        let l:end_comment   = '*)'
        let l:line_prefix   = ''
    elseif l:ft ==# 'octave'
        let l:start_comment = '%{'
        let l:end_comment   = '}%'
        let l:line_prefix   = '% '
    elseif l:ft ==# 'julia'
        let l:start_comment = '#='
        let l:end_comment   = '=#'
        let l:line_prefix   = ''
    elseif l:ft ==# 'haskell'
        let l:start_comment = '{-'
        let l:end_comment   = '-}'
        let l:line_prefix   = '--'
    elseif l:ft =~# 'vim'
        let l:start_comment = '"""""""""""""""""""""""""""""""""""""""""""""""'
        let l:end_comment   = '"""""""""""""""""""""""""""""""""""""""""""""""'
        let l:line_prefix   = '" '
    elseif l:ft =~# 'sh\|bash\|R\|sage'
        let l:start_comment = '###############################################'
        let l:end_comment   = '###############################################'
        let l:line_prefix   = '# '
    elseif l:ft =~# 'vbasic'
        let l:start_comment = 'REM ###########################################'
        let l:end_comment   = 'REM ###########################################'
        let l:line_prefix   = 'REM '
    else
        let l:start_comment = '###############################################'
        let l:end_comment   = '###############################################'
        let l:line_prefix   = '# '
    endif

    let l:content_lines = [
                \ "Parameters",
                \ "----------",
                \ "STARTparam_name : type",
                \ "    Description of the parameter.",
                \ "",
                \ "Returns",
                \ "-------",
                \ "return_type",
                \ "    Description of the return value.",
                \ "",
                \ "Raises",
                \ "------",
                \ "ExceptionType",
                \ "    Description of the exception."
                \ ]

    let l:doc_lines = []
    if l:start_comment != ''
        call add(l:doc_lines, l:start_comment)
    endif

    for line in l:content_lines
        call add(l:doc_lines, l:line_prefix . line)
    endfor

    if l:end_comment != ''
        call add(l:doc_lines, l:end_comment)
    endif

    " Insert below current line
    call append(line('.'), l:doc_lines)
    " Go to START line
    execute "%s/START/\\=''"
    " Switch to insert mode at cursor
    startinsert
endfunction


"*****************************************************************************
"* Automatische Regeln
"*****************************************************************************
" *InhaltsverzeichnisAutomatischeRegeln*

" Bei Dateiöffnung wird das Verzeichnis zum Arbeitsverzeichnis
autocmd BufEnter * silent! lcd %:p:h

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  " Außer bei der Konfigurationsdatei von Vim
  autocmd BufReadPost $MYVIMRC normal! gg
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call SetupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"* Befehle
"*****************************************************************************
" *InhaltsverzeichnisBefehle*

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" delete all entries in registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
autocmd VimLeave * WipeReg

nnoremap <silent>  <F2>    :NERDTreeToggle %:p:h<CR>
nnoremap <silent>  <S-F2>  :NERDTreeFind<CR>
nnoremap <silent>  <C-F2>  :NERDTreeCWD<CR>
nnoremap <silent>  <F3>    :set invnumber<CR>
nnoremap <silent>  <S-F3>  :set invrelativenumber<CR>
nnoremap <silent>  <F4>    :call PrintToPDF()<CR>
nnoremap <silent>  <F5>    :TagbarToggle<CR>
nnoremap <silent>  <C-F5>  :call WriteQuickfixToFile()<CR>
nnoremap <silent>  <F6>    :call DiffWithSaved()<CR>
nnoremap <silent>  <S-F6>  :call DiffWithGit()<CR>
nnoremap <silent>  <F7>    :GitMessenger<CR>
nnoremap <silent>  <F8>    :call Kompiliere()<CR>
nnoremap <silent>  <S-F8>  :call PreKompiliere()<CR>
nnoremap <silent>  <C-F8>  :call PostKompiliere()<CR>
nnoremap <silent>  <F9>    :call GitCommitPush()<CR>
nnoremap <silent>  <S-F9>  :call GitCommitPop()<CR>
nnoremap <silent>  <C-F9>  :call GitCommitPushPopUp()<CR>
nnoremap <silent>  <F10>   :Startify<CR>
nnoremap <silent>  <F12>   :call InsertDocstring()<CR>


nnoremap <C-Del> :call delete(expand('%'))<CR>


"*****************************************************************************
"* Plug Einstellungen
"*****************************************************************************
" *InhaltsverzeichnisPlugEinstellungen*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git-messenger
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:git_messenger_no_default_mappings = v:true

"*****************************************************************************
"* NERDTree
"*****************************************************************************
" *InhaltsverzeichnisNERDTree*

" Open nerdtree window on opening Vim
au VimEnter * NERDTreeToggle /home/abraxas/Projekte | :NERDTree %:p:h | wincmd p

" Set NerdTREE Size
:let g:NERDTreeWinSize=30

" Sortiere Dateien nach letztem Änderungsdatum
let g:NERDTreeSortOrder = ['\/$', '*', '[[-timestamp]]']

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


let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkGoldenrod3', 'DarkOrchid3', 'DarkOrange3', 'SeaGreen3', 'FireBrick', 'LemonChiffon3']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta', 'Darkblue']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:NERDTreeHijackNetrw=0

autocmd User NERDTreeNewFile call feedkeys("Rjo")

"*****************************************************************************
"" Startify
"*****************************************************************************
" *InhaltsverzeichnisStartify*

let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'
let g:startify_files_number = 8
let g:startify_lists = [
	        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
	        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
		\ { 'type': 'files',     'header': ['   Letzte Dateien']},
		\ { 'type': 'dir',       'header': ['   Letzter Ordner']},
		\ { 'type': 'sessions',  'header': ['   Sessions']},
		\ { 'type': 'commands',  'header': ['   Planung']},
		\ { 'type': 'bookmarks', 'header': ['   Lesezeichen']},
		\ ]
let g:startify_bookmarks = [
	\ { 'w': '~/.vim/templates/' },
	\ { 'y': '~/.vimrc' },
	\ { 'z': '~/.zshrc'},
	\ ]
let g:startify_commands = [
	\ {'a': ['Tagesplanung', ':Calendar -view=day']},
	\ {'b': ['Wochenplanung', ':Calendar -view=week']},
	\ {'c': ['Monatsplanung', ':Calendar -view=month']},
	\ {'d': ['Kalender', ':Calendar -view=year']},
	\ {'u': ['Uhr', ':Calendar -view=clock']},
	\ {'n': ['Neue Notiz', ':Note']},
	\ {'o': ['OldFiles', ':browse oldfiles']},
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


"*****************************************************************************
"* Einstellungen Sprachen
"*****************************************************************************
" *InhaltsverzeichnisEinstellungenSprachen*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Assembler
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_ignore_files = ['.*\.nasm', '.*\.asm']
let g:ale_pattern_options = {
\   '.*\.nasm$': {'ale_enabled': 0},
\   '.*\.asm$': {'ale_enabled': 0},
\}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C, C++, C#, F#
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp,*.cc,*.cxx,*.cs,*.fs,*.fsi,*.fsx
    \ setlocal textwidth=79 |
    \ setlocal shiftwidth=4 |
    \ setlocal tabstop=4 |
    \ setlocal expandtab |
    \ setlocal softtabstop=4 |
    \ setlocal shiftround |
    \ setlocal autoindent |
    \ setlocal fileformat=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.clj,*.cljs,*.cljc,*.edn
    \ setlocal textwidth=79 |
    \ setlocal shiftwidth=2 |
    \ setlocal tabstop=2 |
    \ setlocal expandtab |
    \ setlocal softtabstop=2 |
    \ setlocal shiftround |
    \ setlocal autoindent |
    \ setlocal fileformat=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fortran, ASM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.f90,*.f95,*.f03,*.f,*.for,*.s,*.asm
    \ setlocal textwidth=79 |
    \ setlocal shiftwidth=4 |
    \ setlocal tabstop=4 |
    \ setlocal expandtab |
    \ setlocal softtabstop=4 |
    \ setlocal shiftround |
    \ setlocal autoindent |
    \ setlocal fileformat=unix


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Java, Kotlin, Scala
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.java,*.kt,*.kts,*.scala,*.dart
    \ setlocal textwidth=79 |
    \ setlocal shiftwidth=4 |
    \ setlocal tabstop=4 |
    \ setlocal expandtab |
    \ setlocal softtabstop=4 |
    \ setlocal shiftround |
    \ setlocal autoindent |
    \ setlocal fileformat=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Javascript, Typescript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx
    \ setlocal textwidth=79 |
    \ setlocal shiftwidth=2 |
    \ setlocal tabstop=2 |
    \ setlocal expandtab |
    \ setlocal softtabstop=2 |
    \ setlocal shiftround |
    \ setlocal autoindent |
    \ setlocal fileformat=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Julia, OCaml, Haskell
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.jl,*.ml,*.mli,*.hs
    \ setlocal textwidth=79 |
    \ setlocal shiftwidth=4 |
    \ setlocal tabstop=4 |
    \ setlocal expandtab |
    \ setlocal softtabstop=4 |
    \ setlocal shiftround |
    \ setlocal autoindent |
    \ setlocal fileformat=unix


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OCaml
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp^="/home/abraxas/.opam/default/share/ocp-indent/vim"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Perl, COBOL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.pl,*.pm,*.cob,*.cbl
    \ setlocal textwidth=79 |
    \ setlocal shiftwidth=4 |
    \ setlocal tabstop=4 |
    \ setlocal expandtab |
    \ setlocal softtabstop=4 |
    \ setlocal shiftround |
    \ setlocal autoindent |
    \ setlocal fileformat=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType python set makeprg=python\ %

highlight BadWhitespace ctermbg=red guibg=red

au BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile, BufRead *.py
    \ set textwidth=79    " lines longer than 79 columns will be broken
    \ set shiftwidth=4    " operation >> indents 4 columns; << unindents 4 columns
    \ set tabstop=4       " a hard TAB displays as 4 columns
    \ set expandtab       " insert spaces when hitting TABs
    \ set softtabstop=4   " insert/delete 4 spaces when hitting a TAB/BACKSPACE
    \ set shiftround      " round indent to multiple of 'shiftwidth'
    \ set autoindent      " align the new line indent with the previous line
    \ set fileformat=unix " LF line endings (\n), not Windows (\r\n) or Mac (\r)
    \ set foldexpr=getline(v:lnum)=~'^\s*"""'?'>1':1    " to prevent docstrings from being folded

let python_highlight_all=1    " highlighting all syntax elements

highlight ColorColumn ctermbg=darkblue    " background color for ColorColumn to dark blue 
call matchadd('ColorColumn', '\%81v', 100)    " marks 81st column with ColorColumn highlight

autocmd FileType python call PyFillRegisters()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" R, SQL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.R,*.r,*.sql
    \ setlocal textwidth=79 |
    \ setlocal shiftwidth=4 |
    \ setlocal tabstop=4 |
    \ setlocal expandtab |
    \ setlocal softtabstop=4 |
    \ setlocal shiftround |
    \ setlocal autoindent |
    \ setlocal fileformat=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rust, Go
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.rs,*.go
    \ setlocal textwidth=79 |
    \ setlocal shiftwidth=4 |
    \ setlocal tabstop=4 |
    \ setlocal expandtab |
    \ setlocal softtabstop=4 |
    \ setlocal shiftround |
    \ setlocal autoindent |
    \ setlocal fileformat=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! SetupWrapping()
  setlocal wrap
  setlocal linebreak
endfunction


"*****************************************************************************
"* Sonstiges
"*****************************************************************************
" *InhaltsverzeichnisSonstiges*

" set runtimepath^=~/.vim/bundle/vlime/vim

" devicons: reasonable defaults from webinstall.dev/vim-devicons
source ~/.vim/plugins/devicons.vim

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


function! PrettyPrintCSV()
  let lines = getline(1, '$')
  let rows = map(copy(lines), {idx, val -> split(val, ',')})

  " Spaltenanzahl bestimmen
  let maxcols = 0
  for row in rows
    let maxcols = max([maxcols, len(row)])
  endfor

  " Spaltenbreiten berechnen
  let colwidths = repeat([0], maxcols)
  for row in rows
    for i in range(len(row))
      let colwidths[i] = max([colwidths[i], strdisplaywidth(row[i])])
    endfor
  endfor

  " Hilfsfunktionen für Rahmen
  function! s:make_border(colwidths, corner_char, line_char)
    let parts = []
    for width in a:colwidths
      call add(parts, repeat(a:line_char, width + 2))
    endfor
    return a:corner_char . join(parts, a:corner_char) . a:corner_char
  endfunction

  function! s:make_row(row, colwidths)
    let cells = []
    for i in range(len(a:colwidths))
      let val = get(a:row, i, '')
      let pad = a:colwidths[i] - strdisplaywidth(val)
      call add(cells, ' ' . val . repeat(' ', pad + 1))
    endfor
    return '|' . join(cells, '|') . '|'
  endfunction

  " Formatierte Zeilen erzeugen
  let newlines = []
  let border = s:make_border(colwidths, '+', '-')
  call add(newlines, border)
  call add(newlines, s:make_row(rows[0], colwidths)) " Header-Zeile
  call add(newlines, border)

  " Restliche Zeilen
  for row in rows[1:]
    call add(newlines, s:make_row(row, colwidths))
  endfor


  " Anzeigeoptionen für bessere Darstellung
  " In neuem Buffer anzeigen
  " Neues Fenster öffnen und auf 90% setzen
  belowright new
  resize +90%
  setlocal buftype=nofile bufhidden=hide noswapfile
  call setline(1, newlines)
  setlocal nomodifiable
  setlocal nowrap nolinebreak
endfunction

command! PrettyCSV call PrettyPrintCSV()

command! DropNA :!python3 -c "import pandas as pd; f='%'; df=pd.read_csv(f); df.dropna().to_csv(f, index=False)" | e!

command! ExcelToCSV execute '!python3 -c "import pandas as pd; f=''%''; df=pd.read_excel(f); df.to_csv(f.replace(''.xlsx'', ''.csv''), index=False)"' | execute 'edit ' . expand('%:r') . '.csv'

function! LastGitEdit()
    let l:last_edit = system('git ls-files -t | sort -k 2 -r | head -n 1 | cut -d " " -f 2')
    if v:shell_error
        echo "Kein Git Repository oder Fehler!"
    else
        echo "Zuletzt geänderte Datei: " . l:last_edit
    endif
endfunction

command! LastGitEdit call LastGitEdit()

function! LastGitCreated()
    let l:created = systemlist("git log --diff-filter=A --name-only --pretty=format:'%ct' | paste - - | sort -nr | head -n 1 | cut -f2")
    if v:shell_error || empty(l:created)
        echo "Keine Git-Historie oder Fehler!"
    else
        let l:file = l:created[0]

        " Absoluter Pfad basierend auf dem Git-Root-Verzeichnis
        let l:git_root = system('git rev-parse --show-toplevel')
        if v:shell_error || empty(l:git_root)
            " Falls kein Git-Root gefunden, dann relativ zu aktuellem Verzeichnis
            let l:absolute_path = fnamemodify(l:file, ':p')
        else
            let l:git_root = substitute(l:git_root, '\n', '', 'g')
            let l:absolute_path = fnamemodify(l:git_root . '/' . l:file, ':p')
        endif

        let @" = l:absolute_path

        let l:choice = confirm("Zuletzt erstellte Datei:\n" . l:absolute_path . "\nÖffnen?", "&Ja\n&Nein", 2)
        if l:choice == 1
            execute 'edit ' . fnameescape(l:absolute_path)
        endif
    endif
endfunction

command! LastGitCreated call LastGitCreated()

function! FormatJSON()
:%!python -m json.tool
endfunction
command! FormatJSON call FormatJSON()

function! GitCommitPushPopUp()
    write
    call popup_create(
        \ ['Mehrzeilige Commit-Nachricht eingeben.',
        \  'Speichere mit :w zum Fortfahren.'],
        \ {
        \   'line': 3,
        \   'col': 10,
        \   'minwidth': 50,
        \   'time': 4000,
        \   'padding': [0, 1, 0, 1],
        \   'border': [],
        \   'zindex': 300
        \ })
    botright 10new
    setlocal buftype=acwrite bufhidden=wipe noswapfile nobuflisted
    file COMMIT_MSG
    call setline(1, '# Gebe deine Commit-Nachricht ein:')
    call setline(2, '# Kommentare mit # werden ignoriert')
    call setline(3, '')
    call cursor(3, 1)
    startinsert
    autocmd! BufWriteCmd <buffer> call s:GitCommitFromBuffer()
endfunction

function! s:GitCommitFromBuffer()
    let l:lines = getline(1, '$')
    let l:msg_lines = filter(l:lines, 'v:val !~ "^#" && v:val !=# ""')
    if empty(l:msg_lines)
        echoerr "Keine Commit-Nachricht eingegeben."
        return
    endif
    let l:args = join(map(l:msg_lines, '"-m " . shellescape(v:val)'), ' ')
    bwipeout!
    silent! execute '!git add %'
    silent! execute '!git commit ' . l:args
    silent! execute '!git push'
    redraw!
    echo "Commit & Push abgeschlossen."
endfunction

command! GitCommitPushPopUp call GitCommitPushPopUp()




function! DiffWithGit()
  let file = expand('%')
  let filetype = &filetype
  " Öffne temporäre Datei mit Inhalt aus Git
  exe 'leftabove vnew'
  exe 'read !git show HEAD:' . shellescape(file)
  " Erste Zeile löschen, die vom :read leer bleibt
  normal! ggdd
  " Setze Bufferoptionen
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile readonly filetype=
  " Aktiviere Diff-Modus
  diffthis
  " Springe zurück zum Original-Buffer und aktiviere dort Diff
  wincmd p
  diffthis
endfunction

command! PyReg call PyFillRegisters()

function! PyFillRegisters()
  " Python-typische Imports in Register schreiben
  call setreg('n', 'import numpy as np', 'v')
  call setreg('s', 'import seaborn as sns', 'v')
  call setreg('p', 'import pandas as pd', 'v')
  call setreg('m', 'import matplotlib.pyplot as plt', 'v')
  call setreg('r', 'import re', 'v')
  call setreg('o', 'import os', 'v')
  call setreg('j', 'import json', 'v')
  call setreg('f', 'def function_name(params):\n    """Docstring."""\n    pass', 'v')
  call setreg('c', 'class MyClass:\n    def __init__(self):\n        pass', 'v')
endfunction


func! PreKompiliere()
write
if &filetype == 'c'
    exec "! gcc -std=c99 -O0 -g % -o %<"
    exec "! gdb -batch -ex 'file %<' -ex \"disassemble/rs main\" | less"
elseif &filetype == 'cpp'
	exec "! g++ -O0 -g % -o %<"
    exec "! gdb -batch -ex 'file %<' -ex \"disassemble/rs main\" | less"
elseif &filetype == 'cs'
	exec "! dotnet build -p:LangVersion=latest && dotnet run"
elseif &filetype == 'cobol'
    exec "! cobc -E % | less"
	" exec "!cobc -x -g % -o " . '%:r'
    " exec "!cobdbg " . '%:r'
elseif &filetype == 'erlang'
    exec "! erlc -E % | less"
elseif &filetype == 'fortran'
    exec "! gfortran -cpp -E % | less"
elseif &filetype == 'fsharp'	
	exec "! fsharpc --define:DEBUG % && mono %:r.exe"
elseif &filetype == 'nasm' || &filetype ==# 'asm'
    exec "! nasm -f elf64 -E % | less"
elseif &filetype == 'python'
    exec "! python3 -m dis % | less"
elseif &filetype == 'java'
    exec "! javac % && javap -c %:r | less"
elseif &filetype == 'R'
    exec "! Rscript -e 'source(\"" . shellescape(expand("%")) . "\")' | less"
elseif &filetype == 'rust'
    exec "! rustc -Z unpretty=expanded % | less"
elseif &filetype == 'scala'
	exec "! scalac %"
    exec "! javap -v main.class | less"
elseif &filetype == 'sql'	
	exec "! mysql -u root -p -e \"EXPLAIN $(cat %)\" | less"
elseif &filetype == 'javascript'
    exec "! out.gn/x64.release/d8 --print-opt-code --redirect-code-traces --allow-natives-syntax %"
elseif &filetype == 'kotlin'
    exec "! kotlinc % -d out && find out -name '*.class' -exec javap -c {} + | less"
elseif &filetype == 'haskell'
    exec "! ghc -cpp -E % | less"
elseif &filetype == 'go'
    exec "! go build -tags=debug %:r.go && ./%:r"
elseif &filetype == 'perl'
    exec "! perl -MO=Deparse % | less"
elseif &filetype == 'julia'
    exec "! julia -e 'for ex in Meta.parse.(split(read(\"%\", String), r\"\\n\\n\")); println(@macroexpand ex); println(); end' | less"
elseif &filetype == 'shell'
    exec "! bash -x % | less"
elseif &filetype == 'clojure'
    exec "! clojure -M -e \"(println (macroexpand (read-string (slurp \\\"%\\\"))))\" | less"
elseif &filetype == 'latex'
    exec "! latexdef \\" . input("Makroname: \\") . " | less"
else
    echoerr 'Filetype unknown'
endif
endfunc

func! PostKompiliere()
write
if &filetype == 'c'
    exec "! gcc -S % -o - | less"
elseif &filetype == 'cpp'
    exec "! g++ -S % -o -  | less"
elseif &filetype ==# 'cs'
    let bin = expand('%:r') . '.exe'
    exec "! mcs -debug -optimize- %"
    exec "! monodis " . bin . " | less"
elseif &filetype == 'cobol'
    exec "!cobc -S % -o %<.s && less %<.s"
elseif &filetype == 'erlang'
    exec "!"
elseif &filetype == 'fortran'
    exec "!"
elseif &filetype == 'fsharp'	
	exec "!"
elseif &filetype == 'nasm' || &filetype ==# 'asm'
    exec "!"
elseif &filetype == 'python'
    exec "!"
elseif &filetype == 'java'
    exec "! java -XX:+UnlockDiagnosticVMOptions -XX:+PrintAssembly -XX:+LogCompilation -XX:LogFile=jit.log % | less"
elseif &filetype == 'R'
    exec "!"
elseif &filetype == 'rust'
    exec "!"
elseif &filetype == 'scala'
	exec "! scala -XX:+UnlockDiagnosticVMOptions -XX:+PrintAssembly -XX:+LogCompilation -XX:LogFile=jit.log % | less"
elseif &filetype == 'sql'	
	exec "!"
elseif &filetype == 'javascript'
    exec "!"
elseif &filetype == 'kotlin'
    exec "! kotlinc % -include-runtime -d out.jar && java -XX:+UnlockDiagnosticVMOptions -XX:+PrintAssembly -XX:+LogCompilation -XX:LogFile=jit.log -jar out.jar | less"
elseif &filetype == 'haskell'
    exec "!"
elseif &filetype == 'go'
    exec "!"
elseif &filetype == 'perl'
    exec "!"
elseif &filetype == 'julia'
    exec '!'
elseif &filetype == 'shell'
    exec "!"
elseif &filetype == 'clojure'
    exec "! clojure -J-XX:+UnlockDiagnosticVMOptions -J-XX:+PrintAssembly -J-XX:+LogCompilation -J-XX:LogFile=jit.log % | less"
elseif &filetype == 'latex'
    exec "!"
else
    echoerr 'Filetype unknown'
endif
endfunc
	

function! WriteQuickfixToFile()
  let l:filename = "Fehler.txt"
  let l:lines = []

  " Quickfix-Liste sammeln (z. B. von :make, :grep, Compiler-Fehlern)
  try
    redir => l:qf_output
    silent! clist
    redir END
    call extend(l:lines, ['Quickfix-Fehler:'] + split(l:qf_output, "\n") + [''])
  catch
    call extend(l:lines, ['[Quickfix konnte nicht gelesen werden]'])
  endtry

  " Location-List sammeln (z. B. von ALE, Linter-Plugins, etc.)
  try
    redir => l:ll_output
    silent! llist
    redir END
    call extend(l:lines, ['Location-List-Fehler:'] + split(l:ll_output, "\n") + [''])
  catch
    call extend(l:lines, ['[Location-List konnte nicht gelesen werden]'])
  endtry

  " Datei schreiben
  call writefile(l:lines, l:filename)
  echom "Alle Fehler wurden in " . l:filename . " gespeichert."
endfunction

command! WriteQuickfixToFile :call WriteQuickfixToFile()<CR>

function! PrintToPDF()
  execute 'hardcopy > %.ps | !ps2pdf %.ps && rm %.ps'
  echo "PDF erstellt."
endfunction

command! PrintToPDF :call PrintToPDF()<CR>



function! SyncTodoList()
    " --- Kommentar-Prefix ermitteln ---
    let l:cs = &commentstring !=# '' ? &commentstring : '# %s'
    let l:prefix = substitute(l:cs, '%s.*', '', '')

    let l:lines = getline(1, '$')
    let l:todos = {}
    let l:order = []

    " --- 1. TODOs im Code sammeln ---
    for l:line in l:lines
        if l:line =~ 'TODO('
            let l:id   = matchstr(l:line, 'TODO(\zs[^)]\+\ze)')
            let l:text = matchstr(l:line, '):\s*\zs.*')
            if l:id !=# '' && !has_key(l:todos, l:id)
                let l:todos[l:id] = l:text
                call add(l:order, l:id)
            endif
        endif
    endfor

    " --- 2. TODO-LIST finden ---
    let l:list_start = -1
    for l:i in range(len(l:lines))
        if l:lines[l:i] =~ 'TODO-LIST:'
            let l:list_start = l:i + 1
            break
        endif
    endfor
    if l:list_start == -1
        echo "Keine TODO-LIST gefunden"
        return
    endif

    " --- 3. Bestehende Liste einlesen (Status erhalten) ---
    let l:existing = {}
    let l:i = l:list_start
    while l:i < len(l:lines) && l:lines[l:i] !~ '^\s*$'
        if l:lines[l:i] =~ '\[[ x]\]'
            let l:id     = matchstr(l:lines[l:i], '\]\s*\zs\S\+')
            let l:status = matchstr(l:lines[l:i], '\[\zs.\ze\]')
            let l:existing[l:id] = {'lnum': l:i, 'status': l:status}
        endif
        let l:i += 1
    endwhile

    " --- 4. Liste neu bauen ---
    let l:new_block = []

    " Aktive TODOs — Status aus bestehender Liste übernehmen
    for l:id in l:order
        let l:status = has_key(l:existing, l:id) ? l:existing[l:id].status : ' '
        call add(l:new_block, l:prefix . '[' . l:status . '] ' . l:id . ' ' . l:todos[l:id])
    endfor

    " Entfernte TODOs als erledigt ans Ende
    for l:id in keys(l:existing)
        if !has_key(l:todos, l:id)
            let l:old_text = matchstr(l:lines[l:existing[l:id].lnum], l:id . '\s*\zs.*')
            call add(l:new_block, l:prefix . '[x] ' . l:id . ' ' . l:old_text)
        endif
    endfor

    " --- 5. Block ersetzen ---
    call deletebufline(bufnr('%'), l:list_start + 1, l:i)
    call setline(l:list_start, l:new_block)
endfunction

command! SyncTodoList call SyncTodoList()
