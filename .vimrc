set nocompatible "no idea
set nofoldenable "no idea
set backspace=2	 "for correct backspace behaviour
filetype plugin indent on
set autoindent "everything else is crazy
set tabstop=4 softtabstop=4 shiftwidth=4 "I might be changing universal to 2
set ruler "compiler warnings often give column number, this is cool for that

set encoding=utf-8 fileencoding=utf-8 "icelandic letters and stuff
" mouse stuff
set mouse=a "enable mouse
set ttymouse=sgr "enable mouse when in tmux

set ttyfast "an attempt to speed up scrolling 
set splitbelow splitright "else it splits above and to the left. Arabic much?

" Colors and stuff. This is inspired by Spacegray --------------------
" t_Co=256 to get all the colors in the terminal. Else can fail if screen tmux
set t_Co=256

" only show relative numbers on window that has focus and is in command mode1
" else show normal line numbers
set number
if has('autocmd')
augroup vimrc_linenumbering
	autocmd!
	autocmd WinLeave *
				\ if &number |
				\	set norelativenumber |
				\ endif
	autocmd BufWinEnter *
				\ if &number |
				\	set relativenumber |
				\ endif
	autocmd VimEnter *
				\ if &number |
				\	set relativenumber |
				\ endif
	autocmd WinEnter *
				\ if &number |
				\	set relativenumber |
				\ endif
augroup END
endif

" settings for lightline plugin. Fugitive plugin has to be installed also
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'enable': { 'tabline': 0 },
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }
function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction


" else all text pops one space to the right when adding the 100th line. I try
" not to have more than 1000 lines in a file. But jumping letters at that
" moment would not be favorable
set numberwidth=4

syntax on "the initial biggest diffirence from TextEdit
set background=dark "until we start to switch daytime/nighttime themes
" a corsair to locate the cursor. The 81th character turns magenta
set cursorline cursorcolumn colorcolumn=81 

hi Normal          ctermbg=233  ctermfg=NONE    cterm=NONE

hi Comment         ctermbg=NONE ctermfg=59     cterm=NONE
hi NonText         ctermbg=NONE ctermfg=8      cterm=NONE
hi Title           ctermbg=NONE ctermfg=231    cterm=NONE

hi Constant        ctermbg=NONE ctermfg=9      cterm=NONE
hi Function        ctermbg=NONE ctermfg=9      cterm=NONE
hi Identifier      ctermbg=NONE ctermfg=3      cterm=NONE
hi PreProc         ctermbg=NONE ctermfg=109    cterm=NONE
hi Special         ctermbg=NONE ctermfg=103    cterm=NONE
hi SpecialKey      ctermbg=NONE ctermfg=59     cterm=NONE
hi Statement       ctermbg=NONE ctermfg=13     cterm=NONE
hi String          ctermbg=NONE ctermfg=10     cterm=NONE
hi Type            ctermbg=NONE ctermfg=11     cterm=NONE

hi Cursor          ctermbg=NONE ctermfg=NONE   cterm=NONE
hi CursorColumn    ctermbg=232	ctermfg=NONE   cterm=NONE
hi CursorLine      ctermbg=232	ctermfg=NONE   cterm=NONE
hi ColorColumn     ctermbg=233  ctermfg=magenta   cterm=NONE
hi SignColumn      ctermbg=233  ctermfg=250    cterm=NONE

hi Todo            ctermbg=NONE ctermfg=NONE   cterm=reverse
hi Error           ctermbg=52   ctermfg=12     cterm=underline
hi ErrorMsg        ctermbg=NONE ctermfg=9      cterm=NONE 
hi ModeMsg         ctermbg=NONE ctermfg=249    cterm=NONE 
hi MoreMsg         ctermbg=NONE ctermfg=249    cterm=NONE 
hi WarningMsg      ctermbg=NONE ctermfg=12     cterm=NONE 

hi DiffAdd         ctermbg=65   ctermfg=193    cterm=NONE 
hi DiffChange      ctermbg=60   ctermfg=189    cterm=NONE 
hi DiffDelete      ctermbg=234  ctermfg=9      cterm=NONE 
hi DiffText        ctermbg=234  ctermfg=12     cterm=NONE 

hi helpLeadBlank   ctermbg=NONE ctermfg=NONE   cterm=NONE 
hi helpNormal      ctermbg=NONE ctermfg=NONE   cterm=NONE 

hi LineNr          ctermbg=NONE ctermfg=8      cterm=NONE 
hi CursorLineNr    ctermbg=NONE ctermfg=243    cterm=NONE 

hi Pmenu           ctermbg=233  ctermfg=137    cterm=none 
hi PmenuSel        ctermbg=234  ctermfg=196    cterm=bold 
hi PmenuSbar       ctermbg=233  ctermfg=000    cterm=NONE 
hi PmenuThumb      ctermbg=235  ctermfg=137    cterm=none 

hi WildMenu        ctermbg=110  ctermfg=235    cterm=bold 

hi StatusLine      ctermbg=235  ctermfg=249    cterm=NONE 
hi StatusLineNC    ctermbg=232  ctermfg=239    cterm=NONE 

hi Underlined      ctermbg=NONE ctermfg=66     cterm=NONE 
hi Ignore          ctermbg=NONE ctermfg=250    cterm=NONE 

hi Visual          ctermbg=8    ctermfg=NONE   cterm=NONE 
hi VisualNOS       ctermbg=NONE ctermfg=NONE   cterm=bold 

hi FoldColumn      ctermbg=NONE ctermfg=242    cterm=NONE 
hi Folded          ctermbg=NONE ctermfg=242    cterm=NONE 
hi VertSplit       ctermbg=238  ctermfg=238    cterm=NONE 

hi IncSearch       ctermbg=9    ctermfg=0      cterm=NONE 
hi Search          ctermbg=11   ctermfg=0      cterm=NONE 

hi TabLine         ctermbg=232  ctermfg=249    cterm=NONE 
hi TabLineFill     ctermbg=235  ctermfg=239    cterm=NONE 
hi TabLineSel      ctermbg=145  ctermfg=0      cterm=NONE 

hi Directory       ctermbg=NONE ctermfg=24     cterm=NONE 
hi MatchParen      ctermbg=NONE ctermfg=11     cterm=bold 

hi SpellBad        ctermbg=52   ctermfg=9      cterm=NONE 
hi SpellRare       ctermbg=53   ctermfg=13     cterm=NONE 
hi SpellCap        ctermbg=17   ctermfg=12     cterm=NONE 
hi SpellLocal      ctermbg=24   ctermfg=14     cterm=NONE 

" Highlight Links {{{1
" Most of the links are mercilessly stolen from romainl's amazing Apprentice
" theme. (https://github.com/romainl/Apprentice)
hi link Boolean             Constant
hi link Character           Constant
hi link Number              Constant

hi link Conceal             Normal
hi link Float               Number

hi link Define              Preproc
hi link Include             Preproc
hi link Macro               Preproc
hi link PreCondit           PreProc

hi link Conditional         Statement
hi link Exeption            Statement
hi link HelpCommand         Statement
hi link HelpExample         Statement
hi link Keyword             Statement
hi link Label               Statement
hi link Operator            Statement
hi link Repeat              Statement

hi link StorageClass        Type
hi link Structure           Type
hi link Typedef             Type

hi link Debug               Special
hi link Delimiter           Special
hi link SpecialChar         Special
hi link SpecialComment      Special
hi link Tag                 Special

" HTML
hi link htmlEndTag          htmlTagName
hi link htmlLink            Function
hi link htmlSpecialTagName  htmlTagName
hi link htmlTag             htmlTagName

" Rails
hi link rubyRailsARAssociationMethod  Statement
hi link rubyRailsARValidationMethod   Statement
hi link rubyRailsARMethod             Statement
hi link rubyRailsARCallbackMethod     Statement
hi link rubyRailsARClassMethod        Statement

" Diff
hi link diffAdded           String
hi link diffRemoved         Constant
" old colors
" set background=light
" highlight CursorLine		cterm=NONE	ctermfg=NONE	ctermbg=232 
" highlight CursorColumn		cterm=NONE	ctermfg=NONE	ctermbg=232 
" highlight CursorLineNr		term=bold	ctermfg=57
" highlight Normal		ctermfg=NONE	ctermbg=234
" highlight ColorColumn		ctermfg=magenta ctermbg=234


" to get rid of the sticky color marking on old search
set incsearch 
set nohlsearch


" This is for the ejs syntax highlighting
au BufNewFile,BufRead *.ejs set filetype=html
autocmd Filetype ejs setlocal ts=2 sts=2 sw=2 autoindent nofoldenable

" This is for the less syntax highlighting
" au BufNewFile,BufRead *.less set filetype=css

" This is for the jade syntax highlighting and indent width
autocmd BufRead,BufNewFile *.jade set filetype=jade
autocmd Filetype jade setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
" This is for escaping nested hell, where all the code ends on the right side
autocmd Filetype html setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
autocmd Filetype css setlocal ts=2 sts=2 sw=2 autoindent nofoldenable

" 4 spaces for indentation? Hell no. Not even 2. Use tabs.
function SvenniStandard()
	%s/    /\t/g
	%s/  /\t/g
endfunction

" ============================= ABBREVIATIONS ===========================
" copyright
abbreviate sdbc // Copyright Svenni Dal - Sveinn Dal Bjornsson -
abbreviate sdbkc // Copyright Svenni Dal - Sveinn Dal Bjornsson & Karitas Olafsdottir -
abbreviate htmlsdbc <!-- Copyright Svenni Dal - Sveinn Dal Bjornsson - -->
abbreviate helloc std::cout << "Hello, world!\n";
abbreviate hellojs console.log('Hello, world!');
abbreviate helloj System.out.println("Hello, world!");
abbreviate sdebug /****************************** DEBUG ***********************/
abbreviate ddebug /*************************** // DEBUG ***********************/

abbreviate consl console.log();<Left><Left>
abbreviate consld console.dir(, { colors: true});<ESC>18<Left>i
abbreviate ddc console.log(chalk.yellow());<Left><Left><Left>
abbreviate dddata console.log(chalk.blue(JSON.stringify(data, null, 2)));
abbreviate testenv if(process.env.NODE_ENV == 'testing'){
abbreviate testsend res.send(JSON.stringify(data));
abbreviate testget data = JSON.parse(res.text);
abbreviate ddata , { data: data});

" catch cpp unit test
abbreviate _test TEST_CASE(
abbreviate _sect SECTION(
abbreviate _requ REQUIRE(
abbreviate _chec CHECK(
abbreviate _scen SCENARIO(
abbreviate _give GIVEN(
abbreviate _when WHEN(
abbreviate _then THEN(

" I keep closing tabs accidentally. No use :x or :w followed by :q
cabbrev wq w

map <F12> !!date<CR>i // Copyright Svenni Dal - Sveinn Dal Bjornsson & Karitas Olafsdottir - <ESC>o<BS><BS><BS><ESC>
map <F6> !!date<CR>i // Copyright Svenni Dal - Sveinn Dal Bjornsson - <ESC>o<BS><BS><BS><ESC>

let mapleader="\<Space>"
imap <Leader>a á
imap <Leader>A Á
imap <Leader>[ ð
imap <Leader>{ Ð
imap <Leader>e é
imap <Leader>E É
imap <Leader>i í
imap <Leader>I Í
imap <Leader>o ó
imap <Leader>O Ó
imap <Leader>u ú
imap <Leader>U Ú
imap <Leader>/ þ
imap <Leader>? Þ
imap <Leader>; æ
imap <Leader>: Æ
imap <Leader>- ö
imap <Leader>_ Ö
