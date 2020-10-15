set exrc
set nocompatible "no idea
"
" FOLDS
set foldmethod=indent
set foldnestmax=2
set foldlevelstart=2

let g:netrw_liststyle = 3

set backspace=2	 "for correct backspace behaviour
filetype plugin indent on
set autoindent
set tabstop=2 softtabstop=2 shiftwidth=2




"set noexpandtab
"THIS IS NOLY FOR PONTUS
"set expandtab
" bolding for markdown
"set conceallevel=2





set ruler "compiler warnings often give column number, this is cool for that

set encoding=utf-8 fileencoding=utf-8 "icelandic letters and stuff
" mouse stuff
set mouse=a "enable mouse
set ttymouse=sgr "enable mouse when in tmux

set ttyfast "an attempt to speed up scrolling 
set splitbelow splitright "else it splits above and to the left.

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
      \             [ 'fugitive', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'fugitive', 'readonly', 'relativepath', 'modified' ] ]
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

" Highlight ES6 template strings
hi link javaScriptTemplateDelim String
hi link javaScriptTemplateVar Text
hi link javaScriptTemplateString String

colorscheme spacegray


" to get rid of the sticky color marking on old search
set incsearch 
set nohlsearch


" This is for the ejs syntax highlighting
au BufNewFile,BufRead *.ejs set filetype=html
autocmd Filetype ejs setlocal ts=2 sts=2 sw=2 autoindent nofoldenable

au BufNewFile,BufRead,BufWinEnter *.js set filetype=javascript
au BufNewFile,BufRead,BufWinEnter *.js syn match Commento /\/\*\*.*\*\// | syn match Lambda /=>/
au BufNewFile,BufRead,BufWinEnter *.go syn match Commento /\/\*\*.*\*\// | syn match Lambda /=>/
au BufNewFile,BufRead,BufWinEnter *.ex syn match Commento /\/\*\*.*\*\// | syn match Lambda /=>/
au BufNewFile,BufRead,BufWinEnter *.exs syn match Commento /\/\*\*.*\*\// | syn match Lambda /=>/
au BufNewFile,BufRead,BufWinEnter *.php syn match Commento /\/\*\*.*\*\// | syn match Lambda /=>/ | set colorcolumn=121

autocmd BufRead,BufNewFile *.jade set filetype=jade
autocmd Filetype jade setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
autocmd BufRead,BufNewFile *.vue set filetype=vue
autocmd Filetype vue setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
autocmd BufRead,BufNewFile *.pug set filetype=pug
autocmd Filetype pug setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
" This is for escaping nested hell, where all the code ends on the right side
autocmd Filetype html setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
autocmd BufRead,BufNewFile *.js set filetype=js
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 autoindent "nofoldenable
autocmd Filetype css setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
autocmd Filetype less setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
autocmd BufRead,BufNewFile *.swift set filetype=swift
autocmd Filetype swift setlocal ts=2 sts=2 sw=2 autoindent nofoldenable
autocmd BufRead,BufNewFile *.scala set filetype=scala
autocmd Filetype scala setlocal ts=2 sts=2 sw=2 autoindent nofoldenable

autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.mkd set filetype=markdown
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2 nofoldenable

autocmd BufRead,BufNewFile *.php set filetype=php
autocmd Filetype php setlocal tabstop=4 shiftwidth=4 expandtab
autocmd BufRead,BufNewFile *.twig set filetype=twig
autocmd Filetype twig setlocal tabstop=4 shiftwidth=4 expandtab

autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

au BufEnter * setl backupcopy=yes

" 4 spaces for indentation? Hell no. Not even 2. Use tabs.
function SvenniStandard()
	%s/    /\t/g
	%s/  /\t/g
endfunction

" ============================= ABBREVIATIONS ===========================
abbreviate hellojs console.log('Hello! Yes, this is dog!');

abbreviate sendbobsjs console.log('\n\n\n\n\n\nS̞̗͈͉̘̊͂̎ͯe̖͚̥̫͕̬͓ͧ̊͛ͦ͛̅̓̍̌ͥ̓̅n̺̠̗̞̬̪͕͓̤ͫ̍̈͑ͮ͛ͫd͕͇̩̠̻̪̪̈́̽͒̀̈́ͮ͌ͥ̄̈́̑ͅ ̽̍̌̏͛ͥ͋ͫ̐͋̎̇ͥ͂̈́̌̃̚̚b̘̩͍̞̜̤͇̞̥̣̭̰ͪ̆ͮ̔ͭͅͅo̙̣̩̦͊̐͒̆̅ͦ̏ͦ̐ͯͨ͑̂̌ͅb͇̘̮͔̱̪͖̞͖̥͍ͨͩ̒͂̔̄͗s̤̥̳͙̏̈̐͛ͧ̍ͥͧ͂ͥ͗̋ ̳̬̻͔̻̤̯̹̖̙̹͚̭̤͔͗̽ͬ͒ạ̦̜͇̪̺̼̻̯͈̙̈́̑ͯ̔ͩn̮̮̫̰̯̎̄͗̓̈̒̎ͯ̓ͣͫͩͣ̋d̞͙̠ͪ͐̃ͣ̿͌͂͂͌͆̊̏̃̿ͩͅ ̟͔̯͚̉͆̐̏v͓͇͕͎͕̪͔͈̪̙̺̘̾͗ͧͮͬ̌ͩa̖̝̝̱͉̼̹̣͖͎̅̓̂̍̑̋ͧ̾g͉͔͍͚̥͖͐̆̊̓̂͌͐̆ͯ̀̃́͗é͖͒̇ͫͩ͑͊ͤ̉̌̽̇̄ͧ͋ͮ͑͋n̮̣͙̩͍̳̦ͨͯ͑ͪͨ̉̌ͤ̉͂̆ͪe̙̟̫͔̰̼͉̘͙̟̮ͧͯ̏͐̅ͬ͗͂\n\n\n\n\n\n\n');

abbreviate gohello fmt.Println("Hello! Yes, this is dog!")
abbreviate helloj System.out.println("Hello! Yes, this is dog!");
"
" debug
abbreviate sdebug /****************************** DEBUG ***********************/
abbreviate ddebug /*************************** // DEBUG ***********************/
abbreviate conslcake console.log('        CAKE!!\n                              .,-=;//;-\n                 ,    ,=/+%$XH@MM#@:\n       -$##@+$###@H@MMM#######H:.    -/H#\n .,H@H@ X######@ -H#####@+-     -+H###@x\n  .,@##H;      +XM##M/,     =%@###@X;-\n X%-  :M##########$.    .:%M###@%:\n M##H,   +H@@@$/-.  ,;$M###@%,          -\n M###M=,,---,.-%%H####M$:           ,+@##\n @##################@/.          :%##@$-\n M################H,         ;HM##M$=\n ##################.    .=$M##M$=\n #################H..;XM##M$=         .:+\n M####################@%=          =+@MH%\n @#################M/.         =+H#X%=\n =+M###############M,     -/X#X+;.\n  .;XM###########H=    ,/X#H+:,\n     .=+HM#######M+/+HM@+=.\n          ,:/%XM####H/.\n               ,.:=-.');
abbreviate conslbcake console.log(chalk.blue('        CAKE!!\n                              .,-=;//;-\n                 ,    ,=/+%$XH@MM#@:\n       -$##@+$###@H@MMM#######H:.    -/H#\n .,H@H@ X######@ -H#####@+-     -+H###@x\n  .,@##H;      +XM##M/,     =%@###@X;-\n X%-  :M##########$.    .:%M###@%:\n M##H,   +H@@@$/-.  ,;$M###@%,          -\n M###M=,,---,.-%%H####M$:           ,+@##\n @##################@/.          :%##@$-\n M################H,         ;HM##M$=\n ##################.    .=$M##M$=\n #################H..;XM##M$=         .:+\n M####################@%=          =+@MH%\n @#################M/.         =+H#X%=\n =+M###############M,     -/X#X+;.\n  .;XM###########H=    ,/X#H+:,\n     .=+HM#######M+/+HM@+=.\n          ,:/%XM####H/.\n               ,.:=-.'));
iabbrev goprint fmt.Println()<Left><C-o>T<
" javascript
iabbrev constchalk const chalk = require('chalk');
" console logging
iabbrev consl console.log();<Left><Left><C-o>T<
iabbrev conse console.error();<Left><Left><C-o>T<
iabbrev seqerr console.error(chalk.green('HINT:', reason.parent.hint));
iabbrev consll console.log(');<Left><Left><C-o>T<
iabbrev consld console.dir(, { colors: true});<ESC>18hi<C-o>T<
iabbrev consldd console.dir(', { colors: true});<ESC>18hi<C-o>T<
iabbrev ddcr console.log(chalk.red());<Left><Left><Left><C-o>T<
iabbrev ddcg console.log(chalk.green());<Left><Left><Left><C-o>T<
iabbrev ddcb console.log(chalk.blue());<Left><Left><Left><C-o>T<
iabbrev ddcm console.log(chalk.magenta());<Left><Left><Left><C-o>T<
iabbrev ddcc console.log(chalk.cyan());<Left><Left><Left><C-o>T<
iabbrev ddcy console.log(chalk.yellow());<Left><Left><Left><C-o>T<
iabbrev ddcc console.log(chalk.cyan());<Left><Left><Left><C-o>T<
iabbrev dddata console.log(chalk.yellow(JSON.stringify(, null, 2)));<Esc>5ba<C-o>T<
iabbrev cddata const chalk = require('chalk');<CR>console.log(chalk.yellow(JSON.stringify(, null, 2)));<Esc>5ba<C-o>T<
"
" common stuff
iabbrev usestrict 'use strict';
iabbrev expp exports. = (req, res, next) => {<ESC>0f.a<C-o>T<
iabbrev ppromise return new Promise((resolve, reject) => {
iabbrev forl for(let i = 0; i ; i++){<ESC>6hi<C-o>T<
iabbrev ddata , { data: data });
iabbrev routesindex const express = require('express'),<CR>fs = require('fs'),<CR>router = express.Router();<CR><CR>module.exports = (passport) =>{<CR>fs.readdirSync(__dirname).forEach((file) => {<CR>if(file === 'index.js' \|\| file.substr(file.lastIndexOf('.') + 1) !== 'js'){<CR>return;<CR>}<CR>let name = file.substr(0, file.indexOf('.'));<CR>require('./' + name)(router, passport);<CR>});<CR><CR>return router;<CR>};<ESC>
iabbrev routesroute const isAuthenticated = (req, res, next) =>  {<CR>if (req.isAuthenticated()){ return next(); }<CR>res.redirect('/login');<CR>};<CR><CR>module.exports = (router, passport) =>{<CR>};<ESC>Oconst  = require('../controllers/<ESC>26hi<C-o>T<
iabbrev modell const mongoose = require('mongoose'),<CR>Schema = mongoose.Schema;<CR><CR>const = new Schema({<CR>});<CR><CR>module.exports = mongoose.model('', );<ESC>3k0ea<SPACE><C-o>T<
iabbrev modull const Mmm = require('../models/mmm');<CR><CR>exports.get = (data) => {<CR>return new Promise((resolve, reject) => {<CR>Mmm.find((err, mmm) => {<CR>if(err){ reject('failed getting mmm.'); }<CR>else {<CR>data.mmm = mmm;<CR>resolve(data);<CR>}<CR>});<CR>});<CR>};<ESC>gg
iabbrev typestring { type: String, default: '' },
iabbrev typenumber { type: Number, default: 0 },
iabbrev typeboolean { type: Boolean, default: false },
iabbrev typeref { type: String, ref: '', default: null },
iabbrev typedate { type: Date, default: Date.now() },
iabbrev reqb req.body.<C-o>T<
iabbrev reqp req.params.<C-o>T<
iabbrev reqf req.files.<C-o>T<
iabbrev promiss return new Promise((resolve, reject) => {
iabbrev shbe <BS>.should.be.eql ();<ESC>hi<C-o>T<
iabbrev ccatch .catch((reason) => {<CR>console.error('error', reason);<CR>res.status(500).send(reason);<CR>});

" testing dev
iabbrev testenv /* istanbul ignore else */<CR>if(process.env.NODE_ENV == 'testing'){
iabbrev testsend res.json(data);
iabbrev testelse } else {<CR>res.render('<C-o>T<
" testing test
iabbrev testget data = JSON.parse(res.text);
iabbrev testitget it('should', () => {<CR>user<CR>.get('')<CR>.expect(200)<CR>.then((res) => {<CR>const data = JSON.parse(res.text);<CR>});<CR>});<ESC>5kA<BS><BS><ESC>2kf'i <C-o>T<
" iabbrev testitpost it('should', (done) => {<CR>user<CR>.post('')<CR>.expect(200)<CR>.end((err, res) => {<CR>if(err){ done(err); return; }<CR>done();<CR>});<CR>});<ESC>6kA<BS><BS><ESC>2kf'i <C-o>T<
iabbrev testitpost it('should', () => {<CR>user<CR>.post('')<CR>.expect(201)<CR>.then((res) => {<CR>});<CR>});<ESC>4kA<BS><BS><ESC>2kf'i <C-o>T<
iabbrev testdescribe describe('', () => {<CR><CR><CR><CR><CR><CR>});<ESC>6kf'awhen <C-o>T<
iabbrev teststart const app     = require('../app'),<CR>request = require('supertest'),<CR>should  = require('should'),<CR>chalk   = require('chalk'),<CR>user    = request.agent(app);<CR>let data;<CR><CR>describe('', () => {<CR><CR><CR>});<ESC>3kf'awhen <C-o>T<
iabbrev testinit it('should create an admin account and return 200', (done) => {<CR>request(app)<CR>.get('/init')<CR>.expect(200)<CR>.end((err) => {<CR>if(err){ done(err); return; }<CR>done();<CR>});<CR>});<CR>
iabbrev testlogin it('should login the user and return 302', (done) => {<CR>user<CR>.post('/login')<CR>.send({ username: '', password: '' })<CR>.expect(302)<CR>.end((err) => {<CR>if(err){ done(err); return; }<CR>done();<CR>});<CR>});<ESC>6kf'a<C-o>T<
iabbrev testlogout it('should logout the user and return 302', (done) => {<CR>user<CR>.get('/logout')<CR>.expect(302)<CR>.end((err, res) => {<CR>if(err){ done(err); return; }<CR>done();<CR>});<CR>});
iabbrev testclean it('should clean up the database', (done) => {<CR>request(app)<CR>.get('/clean')<CR>.expect(200)<CR>.end((err, res) => {<CR>if(err){ done(err); return; }<CR>done();<CR>});<CR>});<ESC>

iabbrev llorem Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
iabbrev jallard console.log('\n🦆\n');
iabbrev mjallard console.log('\n🦆🦆🦆🦆🦆🦆🦆🦆🦆🦆🦆\n')


iabbrev livereloadjs script(src='http://localhost:35729/livereload.js')
iabbrev htmlsimple <html><CR><head><CR></head><CR><body><CR></body><CR></html><ESC>gg
iabbrev ddoctype <!DOCTYPE HTML>
iabbrev ccharset <meta charset='utf-8'>
iabbrev iinitialscale <meta name="viewport" content="width=device-width, initial-scale=1.0">
iabbrev vviewport <meta name="viewport" content="width=device-width, initial-scale=1.0">

" PHP ABS
iabbrev fwriteout fwrite(STDOUT, print_r(, TRUE));<Left><Left><Left><Left><Left><Left><Left><Left><Left><C-o>T<
iabbrev fwriteerr fwrite(STDERR, print_r(, TRUE));<Left><Left><Left><Left><Left><Left><Left><Left><Left><C-o>T<

" I keep closing tabs accidentally. Now use :x or :w followed by :q or ZZ
cabbrev wq w

" nmap zz zz20<C-e>
nmap <F2> V$%=
nmap <F3> :!cat %<CR>
nmap <F4> ggVGg?
nmap <F7> :!node %<CR>
nmap <F8> :!cat % \| pbcopy <CR>
nmap <F9> :!pandoc -s -o index.html % && open index.html <CR>
nmap <F10> :!open %<CR>

imap <c-j> `

nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

nnoremap <tab> gt
nnoremap <s-tab> gT
nmap K <Plug>(devdocs-under-cursor)
map <C-n> :NERDTreeToggle<CR>


set secure
