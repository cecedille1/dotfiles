"n de défauts bien pratiques (à garder en début de fichier)
set nocompatible

let g:ctrlp_map='<c-x>'
"let g:ctrlp_regexp=1
" let g:ctrlp_open_new_file = 't'
" let g:ctrlp_open_multiple_files = 't'
let g:templates_no_builtin_templates = 1
let g:templates_directory = ['~/.vim/templates']
let g:templates_no_autocmd = 1

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("h")': [],
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<CR>'],
  \ }

let sparkupMapsNormal = 1

set wildignore=*.pyc,*.sw?,*.orig,node_modules,*.egg-info,site-packages
set guifont=InputMonoNarrow\ Light

command E lopen

noremap <c-l> :nohl<cr>
noremap <C-z> <nop>
noremap qq <nop>
noremap gw <C-w>w
nnoremap mh :PyCoverageHighlight<CR>
nnoremap mc :PyCoverageClear<CR>
nnoremap mq :PyCoverageSetQuickfix<CR>
nnoremap ml :PyCoverageSetLoclist<CR>

" Coloration syntaxique, indispensable pour ne pas se perdre dans les longs fichiers
syntax on

"Détection du type de fichier pour l'indentation
if has("autocmd")
  filetype indent on
endif

" Récupération de la position du curseur entre 2 ouvertures de fichiers
" Parfois ce n'est pas ce qu'on veut ...
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" SI c'est pas déjà fait, affiche la position du curseur
set ruler

" Recherche en minuscule -> indépendante de la casse, une majuscule -> stricte
set smartcase

" Ne jamais respecter la casse (attention totalement indépendant du précédent mais de priorité plus faible)
set ignorecase

" Déplacer le curseur quand on écrit un (){}[] (attention il ne s'agit pas du highlight
"set showmatch

set nofoldenable
let g:riv_fold_level=0
" Affiche le nombre de lignes sélectionnées en mode visuel ou la touche/commande qu'on vient de taper en mode commande
set showcmd

" Déplace le curseur au fur et a mesure qu'on tape une recherche, pas toujours pratique, j'ai abandonné
set incsearch

" Utilise la souris pour les terminaux qui le peuvent (tous ?)
" pratique si on est habitué à coller sous la souris et pas sous le curseur, attention fonctionnement inhabituel
"set mouse=a

" A utiliser en live, paste désactive l'indentation automatique (entre autre) et nopaste le contraire
set nopaste

" Indiquer le nombre de modification lorsqu'il y en a plus de 0 suite à une commande
set report=0

" Met en évidence TOUS les résultats d'une recherche, A consommer avec modération
set hlsearch

" Crée des fichiers ~ un peu partout ...
set backup

" La ruse de sioux pour ne pas qu'ils soient partout (à vous de faire le mkdir)
" En général n'édite pas 2 fichiers de même noms fréquemment dans des répertoires différents, sinon évitez
" -> voir by eric plus bas

" Laisse les lignes déborder de l'écran si besoin
set nowrap

" En live pour quand vous écrivez anglais (le fr est à trouver dans les méandres du net)
"set spell


" Spécial développeurs
"
" Indispensable pour ne pas tout casser avec ce qui va suivre
set preserveindent
" indentation automatique
"set autoindent
" Largeur de l'autoindentation
set shiftwidth=4
" Arrondit la valeur de l'indentation
set shiftround
" Largeur du caractère tab
set tabstop=4
" Largeur de l'indentation de la touche tab
set softtabstop=4
" Remplace les tab par des expaces
set expandtab

" by acieroid
" -----------
" Pour highlighter la ligne courante (pour mieux se repérer) en bleu :
"set cursorline
"highlight CursorLine ctermbg=blue

" Pour activer les numéros de lignes dans la marge :
set number

" by eric
" -----------
" Utilise shiftwidth à la place de tabstop en début de ligne (et backspace supprime d'un coup si ce sont des espaces)
set smarttab

" sauvegarder les fichier ~ dans ~/.vim/backup avec crréation du répertoire si celui-ci n'existe pas
if filewritable(expand("~/.vim/backup")) == 2
  set backupdir=$HOME/.vim/backup
else
  if has("unix") || has("win32unix")
    call system("mkdir $HOME/.vim/backup -p")
    set backupdir=$HOME/.vim/backup
  endif
endif

" by anonyme
" -----------
" autoindent n'est spécifique à aucun langage et fonctionne en général moins bien
set noautoindent
filetype plugin indent on
filetype indent on

" by gnuk
" -----------
" On peut passer rapidement du mode paste au mode nopaste avec un raccourcis,
" builtin sur les versions récentes de vim >= 7, sinon il faudrait créer une fonction :

" Toujours laisser des lignes visibles (içi 3) au dessus/en dessous du curseur quand on
" atteint le début ou la fin de l'écran :
set scrolloff=3

" Afficher en permanence la barre d'état (en plus de la barre de commande) :
set laststatus=2

" Format de la barre d'état (tronquée au début, fichier, flags,  :
set statusline=%<%f%m\ %r\ %h\ %w%=%l,%c\ %p%%

" Permettre l'utilisation de la touche backspace dans tous les cas :
set backspace=2

" Envoyer le curseur sur la ligne suivante/précédente après usage des flèches droite/gauche en bout de ligne :
set whichwrap=<,>,[,]

" Tenter de rester toujours sur la même colonne lors de changements de lignes :
set nostartofline

" Nombre de commandes maximale dans l'historique :
set history=50

" Afficher une liste lors de complétion de commandes/fichiers :
"set wildmode=list:full

set guioptions=rai

let syntastic_enable_signs=0
let syntastic_check_on_open=1

set matchpairs=[:],(:),<:>,{:}

" Set an orange cursor in insert mode, and a red cursor otherwise.
" Works at least for xterm and rxvt terminals.
" Does not work for gnome terminal, konsole, xfce4-terminal.
if &term =~ "xterm\\|rxvt" && !has("gui_running")
  :silent !echo -ne "\033]12;green\007"
  let &t_SI = "\033]12;orange\007"
  let &t_EI = "\033]12;green\007"
  autocmd VimLeave * :!echo -ne "\033]12;green\007"
endif

cabbr <expr> %% expand('%:p:h')

map Q 
imap   <space>

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

abbr slef self
abbr sefl self
abbr selg self
abbr dajngo django
abbr djanog django

colorscheme PaperColor

" Le complément du précédent, devine tout seul la couleur du fond (clair sur foncé ou le contraire)
if !has("gui_running")
    set background=dark
else
    set background=light
endif

highlight link htmlLink NONE
highlight PyCoverageMissed guibg=pink

syn match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace gui=undercurl guisp=red ctermbg=red

let g:syntastic_python_checker_args = "--max-line-length=120"
let g:sparkupGoToNext=0
let g:sparkupArgs = '--no-last-newline --expand-divs'

set shortmess+=A
set nofoldenable
set tabpagemax=100
