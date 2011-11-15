set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "kimiko"

"rowcolumn test
set cursorline
set cursorcolumn
"hi Cursor              cterm=inverse
hi CursorLine          cterm=NONE ctermbg=233
hi CursorColumn        ctermbg=234

hi Normal              ctermfg=191              " DEFAULT font color that will be used on all non-special characters

hi Comment             ctermfg=152              " lines that have been commented out

hi Constant            ctermfg=121              " 'contstants', or integers placed outside of a string
hi String              ctermfg=219
hi Number              ctermfg=147

hi LineNr              ctermfg=188 ctermbg=24   " foreground and background of line numbers
hi StatusLine          ctermfg=24 ctermbg=188   " line at bottom of screen with filename, cursor position, etc...

hi Statement           cterm=bold ctermfg=221
hi pythonStatement     cterm=bold ctermfg=226   " stand out
hi Conditional         cterm=bold ctermfg=214
hi Repeat              cterm=bold ctermfg=123
hi Exception           cterm=bold ctermfg=202
hi Operator            cterm=bold ctermfg=204   " and in not

hi Identifier          cterm=bold ctermfg=195               " opening or closing brackets, ex: <  /> 
"hi Function            cterm=bold,underline ctermfg=195  "css misuses for identifiers
hi pythonBuiltin       cterm=bold ctermfg=74    "True, all(), etc

hi Special             ctermfg=197              "

hi Title               cterm=bold,underline ctermfg=211              "
hi htmlH1              cterm=bold ctermfg=211
hi htmlH2              cterm=bold ctermfg=223
hi htmlH3              cterm=bold,underline ctermfg=255
hi htmlH4              cterm=bold,underline  ctermfg=250
hi htmlH5              cterm=bold ctermfg=250
hi htmlH6              ctermfg=252

"hi Cursor              cterm=bold ctermfg=231 ctermbg=82

hi Type                ctermfg=83              " any variable or characters being assigned a value, ex: style=, height=, etc...

hi Visual              ctermbg=23  "ctermfg=232 ctermbg=153

hi Search               ctermbg=24 ctermfg=white
hi IncSearch            cterm=NONE ctermfg=89 ctermbg=118
hi Error                ctermbg=88
hi Todo                 cterm=bold,underline ctermfg=227 ctermbg=89


hi PreProc              cterm=bold ctermfg=141
hi Include              cterm=bold ctermfg=147
hi Define               cterm=bold ctermfg=129

" keyword completion menu
hi Pmenu                ctermfg=255 ctermbg=236
hi PmenuSel             ctermfg=255 ctermbg=22
hi PmenuSbar            ctermfg=250 ctermbg=239 "scrollbar
hi PmenuThumb           ctermfg=244 ctermbg=20  "scrollhandle

" copied links

" language links
hi link htmlTag         htmlTagName
hi link htmlEndTag      htmlSpecialTagName
hi link htmlItalic      htmlUnderline

hi link diffAdded       Type "type is green
hi link diffFile        htmlH2
"broken hi link diffOldFile     diffRemoved
"broken hi link diffNewFile     diffAdded


" Directory
" ModeMsg
" MoreMsg
" Question
" SpecialKey
" WarningMsg
" NonText
" ErrorMsg
"

" needs to be repeated at the end, workaround(?)
"hi CursorLine          cterm=NONE

