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
hi Lambda          ctermbg=NONE ctermfg=87 cterm=NONE
hi ColorColumn     ctermbg=233  ctermfg=magenta   cterm=NONE
colorscheme spacegray


" to get rid of the sticky color marking on old search
set incsearch 
set nohlsearch


" This is for the ejs syntax highlighting
au BufNewFile,BufRead *.ejs set filetype=html
autocmd Filetype ejs setlocal ts=2 sts=2 sw=2 autoindent nofoldenable

"au BufNewFile,BufRead,BufWinEnter *.js set filetype=javascript
au BufNewFile,BufRead,BufWinEnter *.js match Lambda /=>/
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
abbreviate conslcake console.log('        CAKE!!\n                              .,-=;//;-\n                 ,    ,=/+%$XH@MM#@:\n       -$##@+$###@H@MMM#######H:.    -/H#\n .,H@H@ X######@ -H#####@+-     -+H###@x\n  .,@##H;      +XM##M/,     =%@###@X;-\n X%-  :M##########$.    .:%M###@%:\n M##H,   +H@@@$/-.  ,;$M###@%,          -\n M###M=,,---,.-%%H####M$:           ,+@##\n @##################@/.          :%##@$-\n M################H,         ;HM##M$=\n ##################.    .=$M##M$=\n #################H..;XM##M$=         .:+\n M####################@%=          =+@MH%\n @#################M/.         =+H#X%=\n =+M###############M,     -/X#X+;.\n  .;XM###########H=    ,/X#H+:,\n     .=+HM#######M+/+HM@+=.\n          ,:/%XM####H/.\n               ,.:=-.');
abbreviate conslbcake console.log(chalk.blue('        CAKE!!\n                              .,-=;//;-\n                 ,    ,=/+%$XH@MM#@:\n       -$##@+$###@H@MMM#######H:.    -/H#\n .,H@H@ X######@ -H#####@+-     -+H###@x\n  .,@##H;      +XM##M/,     =%@###@X;-\n X%-  :M##########$.    .:%M###@%:\n M##H,   +H@@@$/-.  ,;$M###@%,          -\n M###M=,,---,.-%%H####M$:           ,+@##\n @##################@/.          :%##@$-\n M################H,         ;HM##M$=\n ##################.    .=$M##M$=\n #################H..;XM##M$=         .:+\n M####################@%=          =+@MH%\n @#################M/.         =+H#X%=\n =+M###############M,     -/X#X+;.\n  .;XM###########H=    ,/X#H+:,\n     .=+HM#######M+/+HM@+=.\n          ,:/%XM####H/.\n               ,.:=-.'));

abbreviate consl console.log);<Left><Left>
abbreviate consld console.dir, { colors: true});<ESC>18<Left>i
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

nmap <F12> !!date<CR>i// Copyright Svenni Dal - Sveinn Dal Bjornsson & Karitas Olafsdottir - <ESC>o<BS><BS><BS><ESC>
nmap <F6> !!date<CR>i// Copyright Svenni Dal - Sveinn Dal Bjornsson - <ESC>o<BS><BS><BS><ESC>
