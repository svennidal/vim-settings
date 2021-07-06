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


iabbrev consl console.log();<Left><Left><C-o>T<
iabbrev conse console.error();<Left><Left><C-o>T<
"
" common stuff
iabbrev expp exports. = (req, res, next) => {<ESC>0f.a<C-o>T<
iabbrev ppromise return new Promise((resolve, reject) => {
iabbrev forl for(let i = 0; i ; i++){<ESC>6hi<C-o>T<
iabbrev reqb req.body.<C-o>T<
iabbrev reqp req.params.<C-o>T<
iabbrev reqf req.files.<C-o>T<

" print colors in go
iabbrev printfred fmt.Printf("\033[31m\033[0m\n")<ESC>10hi<C-o>T<
iabbrev printfgreen fmt.Printf("\033[32m\033[0m\n")<ESC>10hi<C-o>T<
iabbrev printfyellow fmt.Printf("\033[33m\033[0m\n")<ESC>10hi<C-o>T<
iabbrev printfblue fmt.Printf("\033[34m\033[0m\n")<ESC>10hi<C-o>T<
iabbrev printfpurple fmt.Printf("\033[35m\033[0m\n")<ESC>10hi<C-o>T<
iabbrev printfcyan fmt.Printf("\033[36m\033[0m\n")<ESC>10hi<C-o>T<


iabbrev llorem Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
iabbrev jallard console.log('\n🦆\n');
iabbrev mjallard console.log('\n🦆🦆🦆🦆🦆🦆🦆🦆🦆🦆🦆\n')


iabbrev htmlsimple <html><CR><head><CR></head><CR><body><CR></body><CR></html><ESC>gg
iabbrev ddoctype <!DOCTYPE HTML>
iabbrev ccharset <meta charset='utf-8'>
iabbrev iinitialscale <meta name="viewport" content="width=device-width, initial-scale=1.0">
iabbrev vviewport <meta name="viewport" content="width=device-width, initial-scale=1.0">

iabbrev goprintjson func prettyPrint(d data) {<CR>dJSON, err := json.MarshalIndent(d, "", "  ")<CR>if err != nil {<CR>log.Fatalf(err.Error())<CR>}<CR>fmt.Printf("\033[36mMarshalIndent funnction output \033[0m \033[33m%s\033[0m\n", string(dJSON))<CR>fmt.Printf("\033[33m\033[0m\n")<CR>}

" I keep closing tabs accidentally. Now use :x or :w followed by :q or ZZ
cabbrev wq w

" nmap zz zz20<C-e>
nmap <F2> V$%=
nmap <F3> :!cat %<CR>
nmap <F4> ggVGg?
nmap <F5> :set list<CR>
nmap <F6> :set list!<CR>
nmap <F7> :GoImport 
nmap <F8> :GoImport <C-r><C-w>
nmap <F9> :!pandoc -s -o index.html % && open index.html <CR>
nmap <F10> :!open %<CR>
nmap <12> :!cat % \| pbcopy <CR>

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
