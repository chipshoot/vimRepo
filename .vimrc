"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: amix the lucky stiff
"             http://amix.dk - amix@amix.dk
"
" Version: 3.1 - 17/01/10 19:34:18
"
" Blog_post: 
"       http://amix.dk/blog/post/19486#The-ultimative-vim-configuration-vimrc
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" How_to_Install:
"    $ mkdir ~/.vim_runtime
"    $ svn co svn://orangoo.com/vim ~/.vim_runtime
"    $ cat ~/.vim_runtime/install.sh
"    $ sh ~/.vim_runtime/install.sh <system>
"      <sytem> can be `mac`, `linux` or `windows`
"
" How_to_Upgrade:
"    $ svn update ~/.vim_runtime
"
" Sections:
"    -> Package management
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Command mode related
"    -> Moving around, tabs and buffers
"    -> Statusline
"    -> Parenthesis/bracket expanding
"    -> General Abbrevs
"    -> Editing mappings
"
"    -> Cope
"    -> Minibuffer plugin
"    -> Omni complete functions
"    -> Python section
"    -> JavaScript section
"    -> XML section
"    -> jfang's setting for OESC daily working
"
" Plugins_Included:
"     > minibufexpl.vim - http://www.vim.org/scripts/script.php?script_id=159
"       Makes it easy to get an overview of buffers:
"           info -> :e ~/.vim_runtime/plugin/minibufexpl.vim
"
"     > bufexplorer - http://www.vim.org/scripts/script.php?script_id=42
"       Makes it easy to switch between buffers:
"           info -> :help bufExplorer
"
"     > yankring.vim - http://www.vim.org/scripts/script.php?script_id=1234
"       Emacs's killring, useful when using the clipboard:
"           info -> :help yankring
"
"     > surround.vim - http://www.vim.org/scripts/script.php?script_id=1697
"       Makes it easy to work with surrounding text:
"           info -> :help surround
"
"     > snipMate.vim - http://www.vim.org/scripts/script.php?script_id=2540
"       Snippets for many languages (similar to TextMate's):
"           info -> :help snipMate
"
"     > fuzzyfinder - http://www.vim.org/scripts/script.php?script_id=1984
"       Find files fast (similar to TextMate's feature):
"           info -> :help fuzzyfinder@en
"
"  Revisions:
"     > 3.1: Added revisions ;) and bufexplorer.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Setup environment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MySys()
	return "Linux"
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Package management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the runtime path to inlcude plug.vim and initialize

set nocompatible
filetype off

" setting for managing package with plug.vim
set rtp+=~/.vim/plugged/
call plug#begin('~/.vim/plugged/vimfiles/plugged')
"
" on-demind loading
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'

call plug#end()

" preious setting with vundle.vim
" set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
" call vundle#begin('$HOME/vimfiles/bundle')
" 
" " Let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
" 
" Plugin 'tpope/vim-surround'
" 
" Plugin 'moll/vim-node'
" 
" Plugin 'elzr/vim-json'
" 
" Plugin 'pangloss/vim-javascript'
" 
" Plugin 'leafgarland/typescript-vim'
" 
" " All of Plugins must be added before following line
" call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I'm now using mswin
" jfang
"source $VIMRUNTIME/mswin.vim



" Sets how many lines of history VIM has to remember
set history=300

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
"map <leader>e :e! ~/.vim_runtime/vimrc<cr>
"changed to fit my current working environment
"jfang
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
"autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc
"changed to fit my current working environment
"jfang
autocmd! bufwritepost vimrc source $VIM/_vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu

set ruler "Always show current position

set cmdheight=1 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Set font according to system
if MySys() == "mac"
  set gfn=Bitstream\ Vera\ Sans\ Mono:h13
  set shell=/bin/bash
elseif MySys() == "windows"
  "set gfn=Bitstream\ Vera\ Sans\ Mono:h10
  "I like my current font setting
  "jfang
  set guifont=Consolas:h11,Courier,Lucida\ Console,Letter\ Gothic,
				\Arial\ Alternative,Bitstream\ Vera\ Sans\ Mono,OCR\ A\ Extended
elseif MySys() == "linux"
  set gfn=Monospace\ 10
  set shell=/bin/bash
endif

if has("gui_running")
  "set guioptions-=T
  "normally I need scroll bar
  set guioptions+=bT
  set background=dark
  set t_Co=256
  set background=dark
  "colorscheme peaksea
  "I like my current colorscheme
  "jfang
  colorscheme desert

  set nu
  set lines=999 columns=220
else
  colorscheme zellner
  set background=dark
  
  set nonu
endif

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=dos,unix,mac "Default file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

map <leader>t2 :setlocal shiftwidth=2<cr>
map <leader>t4 :setlocal shiftwidth=4<cr>
"map <leader>t8 :setlocal shiftwidth=4<cr>
"changed to 8 thinking that this is a typo
"jfang
map <leader>t8 :setlocal shiftwidth=8<cr>


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>


function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Useful on some European keyboards
"map ? $
"imap ? $
"vmap ? $
"cmap ? $
"I don't need this
"jfang


func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif   
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

"F8 copy everything into system clipboard
map <F8> gg"+yG

"remap ctrl-A to make sure we can still increase the number
"jfang
noremap <C-kPlus> <C-A>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1

""""""""""""""""""""""""""""""
" => snippetMate plugin
""""""""""""""""""""""""""""""
" Set snippetMate for my own environment
" jfang
let g:snippets_dir="C:/Program\ Files/Vim/vimfiles/snippets/"
:filetype plugin on

""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
"I don't like vertical explorer
"jfang
"let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=0

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>:TMiniBufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
au FileType python set nocindent
syn keyword pythonConstant True None False self
au BufNewFile,BufRead *.jinja set syntax=htmljinja

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 
au FileType Python nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow  = 1
    set foldmethod=syntax
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

""""""""""""""""""""""""""""""
" => XML section
"""""""""""""""""""""""""""""""
let $ADDED = '~/.vim/added/'
if has("win32")
	let $ADDED = $VIM.'/added/'
endif
map <Leader>x :set filetype=xml<CR>
  \:source $VIMRUNTIME/syntax/xml.vim<CR>
  \:set foldmethod=syntax<CR>
  \:source $VIMRUNTIME/syntax/syntax.vim<CR>
  \:source $ADDED/xml.vim<CR>
  \:iunmap <buffer> <Leader>.<CR>
  \:iunmap <buffer> <Leader>><CR>
  \:inoremap \> ><CR>
  \:echo "XML mode is on"<CR>
  "no imaps for <Leader>
  "\:inoremap \. ><CR>

" catalog should be set up
nmap <Leader>l <Leader>cd:%w !xmllint --valid --noout -<CR>
nmap <Leader>r <Leader>cd:%w !rxp -V -N -s -x<CR>
"this need be checked
"jfang
"nmap <Leader>d4 :%w !xmllint --dtdvalid 
" \ "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
" \ --noout -<CR>

vmap <Leader>px !ruby C:/Toolkit/xmlformat.rb <CR>
nmap <Leader>px !!ruby C:/Toolkit/xmlformat.rb <CR>
nmap <Leader>pxa :% !ruby C:/Toolkit/xmlformat.rb <CR>
nmap <Leader>i :%!xsltlint<CR>

""""""""""""""""""""""""""""""
" => SQL section
""""""""""""""""""""""""""""""
map <Leader>s :set syn=sql<CR>
set nowrap

""""""""""""""""""""""""""""""
" => Fuzzy finder
""""""""""""""""""""""""""""""
try
    call fuf#defineLaunchCommand('FufCWD', 'file', 'fnamemodify(getcwd(), ''%:p:h'')')
    map <leader>t :FufCWD **/<CR>
catch
endtry


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Easy review Best Tips of VIM
:nmap <leader>tips :e C:/Users/jfang/Vim/bestTipsVIM.txt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => jfang's setting for OESC daily working
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I need work under my ticket folder
:nmap <leader>tks :set ft=datafix <CR>
    \:set syn=sql <CR>

:nmap <leader>gbs :set ft=gbass <CR>
    \:set syn=sql <CR>

" Auto Add Data Fixer TM script file title
:nmap ,h1 :call PutDataFixerHeader(1)<CR>
:nmap ,h2 :call PutDataFixerHeader(2)<CR>
:nmap ,ph :call PutDataFixerHeader(3)<CR>
:nmap ,gdf :cd C:\Users\jfang\My\ Tickets\Datafixer

" Auto insert date
:nnoremap <F5> "=strftime("%Y-%m-%d")<CR>p
:inoremap <F5> <C-R>=strftime("%Y-%m-%d")<CR>

function! PutDataFixerHeader(blockID)
    let length= line("$")
    let l:pos1  = line(".")+1

    let l:old_cpoptions = &cpoptions " Prevent the alternate buffer from being set to this files
    setlocal cpoptions-=a

    if a:blockID == 1
        let templatefile = 'C:/Users/jfang/My\ Tickets/DataFixer/Templates/DataFixerHeader.txt'
        :goto 1
        let l:pos1  = 1
        exe '0read '.templatefile
    elseif a:blockID == 2
        let templatefile = 'C:/Users/jfang/My\ Tickets/DataFixer/Templates/PermissionBlock.txt'
        let l:pos1 = line("$")
        call setpos('.', [0, pos1, 1, 0])
        exe 'read '.templatefile
    elseif a:blockID == 3
        let templatefile = 'C:/Users/jfang/My\ Tickets/DataFixer/Templates/preHeader.txt'
        :goto 1
        let l:pos1  = 1
        exe '0read '.templatefile
    endif

    let &cpoptions  = l:old_cpoptions   " restore previous options
endfunction

" Stop start NerdTree at start up vim
let g:nerdtree_tabs_open_on_gui_startup=0
map <C-n> :NERDTreeToggle<CR>
