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


syntax match Lambda /=>/ contained
" else all text pops one space to the right when adding the 100th line. I try
" not to have more than 1000 lines in a file. But jumping letters at that
" moment would not be favorable
set numberwidth=4

syntax on "the initial biggest diffirence from TextEdit
set background=dark "until we start to switch daytime/nighttime themes
" a corsair to locate the cursor. The 81th character turns magenta
set cursorline cursorcolumn colorcolumn=81 
hi Lambda          ctermbg=NONE ctermfg=87 cterm=NONE
hi Commento          ctermbg=NONE ctermfg=141 cterm=NONE
hi ColorColumn     ctermbg=233  ctermfg=magenta   cterm=NONE
colorscheme spacegray


" to get rid of the sticky color marking on old search
set incsearch 
set nohlsearch


" This is for the ejs syntax highlighting
au BufNewFile,BufRead *.ejs set filetype=html
autocmd Filetype ejs setlocal ts=2 sts=2 sw=2 autoindent nofoldenable

au BufNewFile,BufRead,BufWinEnter *.js syn match Commento /\/\*\*.*\*\// | syn match Lambda /=>/
" au BufNewFile,BufRead,BufWinEnter *.js match Commento /\/\*\*.*\*\// 
" au BufNewFile,BufRead,BufWinEnter *.js match Lambda /=>/
" au BufNewFile,BufRead,BufWinEnter *.js set filetype=javascript
" This is for the less syntax highlighting
" au BufNewFile,BufRead *.less set filetype=css

" This is for the jade syntax highlighting and indent width
autocmd BufRead,BufNewFile *.jade set filetype=jade
autocmd Filetype jade setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
" This is for escaping nested hell, where all the code ends on the right side
autocmd Filetype html setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
autocmd Filetype css setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
autocmd BufRead,BufNewFile *.swift set filetype=swift
autocmd Filetype swift setlocal ts=2 sts=2 sw=2 autoindent nofoldenable

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
" print("Hello! Yes, this is dog!")
abbreviate helloc std::cout << "Hello! Yes, this is dog!\n";
abbreviate hellojs console.log('Hello! Yes, this is dog!');
abbreviate helloj System.out.println("Hello! Yes, this is dog!");
abbreviate hellos print("Hello! Yes, this is dog!")
abbreviate hellodog 'Hello! Yes, this is dog!'
" debug
abbreviate sdebug /****************************** DEBUG ***********************/
abbreviate ddebug /*************************** // DEBUG ***********************/
abbreviate conslcake console.log('        CAKE!!\n                              .,-=;//;-\n                 ,    ,=/+%$XH@MM#@:\n       -$##@+$###@H@MMM#######H:.    -/H#\n .,H@H@ X######@ -H#####@+-     -+H###@x\n  .,@##H;      +XM##M/,     =%@###@X;-\n X%-  :M##########$.    .:%M###@%:\n M##H,   +H@@@$/-.  ,;$M###@%,          -\n M###M=,,---,.-%%H####M$:           ,+@##\n @##################@/.          :%##@$-\n M################H,         ;HM##M$=\n ##################.    .=$M##M$=\n #################H..;XM##M$=         .:+\n M####################@%=          =+@MH%\n @#################M/.         =+H#X%=\n =+M###############M,     -/X#X+;.\n  .;XM###########H=    ,/X#H+:,\n     .=+HM#######M+/+HM@+=.\n          ,:/%XM####H/.\n               ,.:=-.');
abbreviate conslbcake console.log(chalk.blue('        CAKE!!\n                              .,-=;//;-\n                 ,    ,=/+%$XH@MM#@:\n       -$##@+$###@H@MMM#######H:.    -/H#\n .,H@H@ X######@ -H#####@+-     -+H###@x\n  .,@##H;      +XM##M/,     =%@###@X;-\n X%-  :M##########$.    .:%M###@%:\n M##H,   +H@@@$/-.  ,;$M###@%,          -\n M###M=,,---,.-%%H####M$:           ,+@##\n @##################@/.          :%##@$-\n M################H,         ;HM##M$=\n ##################.    .=$M##M$=\n #################H..;XM##M$=         .:+\n M####################@%=          =+@MH%\n @#################M/.         =+H#X%=\n =+M###############M,     -/X#X+;.\n  .;XM###########H=    ,/X#H+:,\n     .=+HM#######M+/+HM@+=.\n          ,:/%XM####H/.\n               ,.:=-.'));
" javascript
" console logging
iabbrev consl console.log();<Left><Left><C-o>T<
iabbrev consll console.log(');<Left><Left><C-o>T<
iabbrev consld console.dir(, { colors: true});<ESC>18<Left>i<C-o>T<
iabbrev consldd console.dir(', { colors: true});<ESC>18<Left>i<C-o>T<
iabbrev ddc console.log(chalk.yellow());<Left><Left><Left><C-o>T<
iabbrev ddcc console.log(chalk.yellow());<Left><Left><Left><C-o>T<
iabbrev dddata console.log(chalk.blue(JSON.stringify(data, null, 2)));<ESC>
" common stuff
iabbrev usestrict 'use strict';
iabbrev expp exports. = (req, res, next) => {<ESC>0f.a<C-o>T<
iabbrev forl for(let i = 0; i ; i++){<ESC>6<Left>i<C-o>T<
iabbrev forll for(let i = ; i > 0; i--){<ESC>13<Left>i<C-o>T<
iabbrev ddata , { data: data });
iabbrev mongoerr /* istanbul ignore if */<CR>if(err){ console.log(err); }<CR>else {
iabbrev istanif /* istanbul ignore if */
iabbrev istanelse /* istanbul ignore else */
iabbrev routesindex 'use strict';<CR>const express = require('express'),<CR>fs = require('fs'),<CR>router = express.Router();<CR><CR>module.exports = (passport) =>{<CR>fs.readdirSync(__dirname).forEach((file) => {<CR>if(file === 'index.js' \|\| file.substr(file.lastIndexOf('.') + 1) !== 'js'){<CR>return;<CR>}<CR>let name = file.substr(0, file.indexOf('.'));<CR>require('./' + name)(router, passport);<CR>});<CR><CR>return router;<CR>};<ESC>
iabbrev routesroute 'use strict';<CR>const isAuthenticated = (req, res, next) =>  {<CR>if (req.isAuthenticated()){ return next(); }<CR>res.redirect('/login');<CR>};<CR><CR>module.exports = (router, passport) =>{<CR>};<ESC>Orouter.<C-o>T<
iabbrev modell 'use strict';<CR>const mongoose = require('mongoose'),<CR>Schema = mongoose.Schema;<CR><CR>const = new Schema({<CR>});<CR><CR>module.exports = mongoose.model('', );<ESC>3k0ea<SPACE><C-o>T<
iabbrev modull 'use strict';<CR>const Mmm = require('../models/mmm');<CR><CR>exports.get = (data) => {<CR>return new Promise((resolve, reject) => {<CR>Mmm.find((err, mmm) => {<CR>if(err){ reject('failed getting mmm.'); }<CR>else {<CR>data.mmm = mmm;<CR>resolve(data);<CR>}<CR>});<CR>});<CR>};<ESC>gg
iabbrev typestring { type: String, default: '' },
iabbrev reqb req.body.<C-o>T<
iabbrev reqp req.params.<C-o>T<

" testing dev
iabbrev testenv /* istanbul ignore else */<CR>if(process.env.NODE_ENV == 'testing'){
iabbrev testsend res.send(JSON.stringify(data));
iabbrev testelse } else {<CR>res.render('<C-o>T<
" testing test
iabbrev testget data = JSON.parse(res.text);
iabbrev testitget it('', (done) => {<CR>user<CR>.get('<CR><BS><BS>.expect(200)<CR>.end((err, res) => {<CR>data = JSON.parse(res.text);<CR>if(err){ done(err); return; }<CR>done();<CR>});<CR><BS><BS>});<ESC>9kf'ashould <C-o>T<
iabbrev testitpost it('', (done) => {<CR>user<CR>.post('<CR><BS><BS>.expect(302)<CR>.end((err) => {<CR>if(err){ done(err); return; }<CR>done();<CR>});<CR><BS><BS>});<ESC>8kf'ashould <C-o>T<
iabbrev testdescribe describe('', () => {<CR><CR><CR><CR><CR><CR>});<ESC>6kf'awhen <C-o>T<
iabbrev teststart 'use strict';<CR>const app = require('../app'),<CR>request = require('supertest'),<CR>should = require('should'),<CR>user = request.agent(app);<CR>let data;<CR><CR>describe('', () => {<CR><CR><CR><CR><CR><CR>});<ESC>6kf'awhen <C-o>T<
iabbrev testinit it('should create an admin account and return 200', (done) => {<CR>request(app)<CR>.get('/init')<CR>.expect(200)<CR>.end((err) => {<CR>if(err){ done(err); return; }<CR>done();<CR>});<CR>});<CR>
iabbrev testlogin it('should login the user and return 302', (done) => {<CR>user<CR>.post('/login')<CR>.send({ username: '', password: '' })<CR>.expect(302)<CR>.end((err) => {<CR>if(err){ done(err); return; }<CR>done();<CR>});<CR>});<ESC>6kf'a<C-o>T<
iabbrev testlogout it('should logout the user and return 302', (done) => {<CR>user<CR>.get('/logout')<CR>.expect(302)<CR>.end((err, res) => {<CR>if(err){ done(err); return; }<CR>done();<CR>});<CR>});
iabbrev testclean it('should login the user and return 302', (done) => {<CR>request(app)<CR>.get('/clean')<CR>.expect(200)<CR>.end((err, res) => {<CR>if(err){ done(err); return; }<CR>done();<CR>});<CR>});<ESC>

" catch cpp unit test
iabbrev _test TEST_CASE(
iabbrev _sect SECTION(
iabbrev _requ REQUIRE(
iabbrev _chec CHECK(
iabbrev _scen SCENARIO(
iabbrev _give GIVEN(
iabbrev _when WHEN(
iabbrev _then THEN(

iabbrev findsjavar Restaurant.findOne({ 'name': 'Sjavarpakkhusid' }, (err, Rest) => {<CR>if(err){ console.log(err); }<CR>else {
iabbrev updatesjavar restModule.update(Rest);

iabbrev kvesve Kveðja,<CR>Svenni Dal<CR><CR>svennidal@jokula.is<CR>+3548231066

" I keep closing tabs accidentally. No use :x or :w followed by :q
cabbrev wq w

nmap zz zz20<C-e>
nmap <F2> !!date<CR>i// Copyright 2016, Svenni Dal(Sveinn Dal Bjornsson) & //JÖKULÁ, All rights reserved <ESC>o><BS><ESC>
nmap <F3> :!cat %<CR>
nmap <F4> ggVGg?
nmap <F5> !!date<CR>i// Copyright 2016, Svenni Dal(Sveinn Dal Bjornsson), All rights reserved <ESC>o><BS><ESC>
" nmap <F6> !!date<CR>i// Copyright Svenni Dal - Sveinn Dal Bjornsson & Karitas Olafsdottir - <ESC>o<BS><BS><BS><ESC>
nmap <F6> !!date<CR>i// Copyright 2016, Svenni Dal(Sveinn Dal Bjornsson), All rights reserved <ESC>o<BS><BS><BS><ESC>
nmap <F7> :!node %<CR>
nmap <F8> :!cat % \| pbcopy <CR>
nmap <F9> :!pandoc -s -o temp.html % && open temp.html <CR>
nmap <F10> :!open %<CR>
nmap <F12> !!date<CR>i// Copyright 2016, Svenni Dal(Sveinn Dal Bjornsson) & //JÖKULÁ, All rights reserved <ESC>o<BS><BS><BS><ESC>
