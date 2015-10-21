" Spacegray

hi Lambda          ctermbg=NONE ctermfg=87 cterm=NONE
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
hi CursorColumn    ctermbg=16	ctermfg=NONE   cterm=NONE
hi CursorLine      ctermbg=16	ctermfg=NONE   cterm=NONE
hi ColorColumn     ctermbg=233  ctermfg=magenta   cterm=NONE
hi SignColumn      ctermbg=16   ctermfg=250    cterm=NONE

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
