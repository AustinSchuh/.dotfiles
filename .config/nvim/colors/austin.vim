" Maintainer: Austin Schuh <austin.linux@gmail.com>

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='austin'

hi SpecialKey     term=bold ctermfg=4 guifg=Blue
hi link EndOfBuffer    NonText
hi NonText        term=bold ctermfg=12 gui=bold guifg=Blue
hi Directory      term=bold ctermfg=4 guifg=Blue
hi ErrorMsg       term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
hi IncSearch      term=reverse cterm=reverse gui=reverse
hi Search         term=reverse ctermbg=11 guibg=Yellow
hi MoreMsg        term=bold ctermfg=2 gui=bold guifg=SeaGreen
hi ModeMsg        term=bold cterm=bold gui=bold
hi LineNr         term=underline ctermfg=130 guifg=Brown
hi CursorLineNr   term=bold cterm=underline ctermfg=130 gui=bold guifg=Brown
hi Question       term=standout ctermfg=2 gui=bold guifg=SeaGreen
hi StatusLine     term=bold,reverse cterm=bold,reverse gui=bold,reverse
hi StatusLineNC   term=reverse cterm=reverse gui=reverse
hi VertSplit      term=reverse cterm=reverse gui=reverse
hi Title          term=bold ctermfg=5 gui=bold guifg=Magenta
hi Visual         term=reverse ctermbg=7 guibg=LightGrey
hi WarningMsg     term=standout ctermfg=1 guifg=Red
hi WildMenu       term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi Folded         term=standout ctermfg=4 ctermbg=248 guifg=DarkBlue guibg=LightGrey
hi FoldColumn     term=standout ctermfg=4 ctermbg=248 guifg=DarkBlue guibg=Grey
hi DiffAdd        term=bold ctermbg=81 guibg=LightBlue
hi DiffChange     term=bold ctermbg=225 guibg=LightMagenta
hi DiffDelete     term=bold ctermfg=12 ctermbg=159 gui=bold guifg=Blue guibg=LightCyan
hi DiffText       term=reverse cterm=bold ctermbg=9 gui=bold guibg=Red
hi SignColumn     term=standout ctermfg=4 ctermbg=248 guifg=DarkBlue guibg=Grey
hi Conceal        ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
hi SpellBad       term=reverse ctermbg=224 gui=undercurl guisp=Red
hi SpellCap       term=reverse ctermbg=81 gui=undercurl guisp=Blue
hi SpellRare      term=reverse ctermbg=225 gui=undercurl guisp=Magenta
hi SpellLocal     term=underline ctermbg=14 gui=undercurl guisp=DarkCyan
hi Pmenu          ctermfg=0 ctermbg=225 guibg=LightMagenta
hi PmenuSel       ctermfg=0 ctermbg=7 guibg=Grey
hi PmenuSbar      ctermbg=248 guibg=Grey
hi PmenuThumb     ctermbg=0 guibg=Black
hi TabLine        term=underline cterm=underline ctermfg=0 ctermbg=7 gui=underline guibg=LightGrey
hi TabLineSel     term=bold cterm=bold gui=bold
hi TabLineFill    term=reverse cterm=reverse gui=reverse
hi CursorColumn   term=reverse ctermbg=7 guibg=Grey90
hi CursorLine     term=underline cterm=underline guibg=Grey90
hi ColorColumn    term=reverse ctermbg=224 guibg=LightRed
hi link QuickFixLine   Search
hi StatusLineTerm term=bold,reverse cterm=bold ctermfg=15 ctermbg=2 gui=bold guifg=bg guibg=DarkGreen
hi StatusLineTermNC term=reverse ctermfg=15 ctermbg=2 guifg=bg guibg=DarkGreen
hi MatchParen     term=reverse ctermbg=14 guibg=Cyan
hi ToolbarLine    term=underline ctermbg=7 guibg=LightGrey
hi ToolbarButton  cterm=bold ctermfg=15 ctermbg=242 gui=bold guifg=White guibg=Grey40
hi Error          term=reverse ctermfg=15 ctermbg=9 guifg=White guibg=Red
hi Comment        term=bold ctermfg=4 guifg=Blue
hi Constant       term=underline ctermfg=1 guifg=Magenta
hi Special        term=bold ctermfg=5 guifg=#6a5acd
hi Identifier     term=underline ctermfg=6 guifg=DarkCyan
hi Statement      term=bold ctermfg=130 gui=bold guifg=Brown
hi PreProc        term=underline ctermfg=5 guifg=#6a0dad
hi Type           term=underline ctermfg=2 gui=bold guifg=SeaGreen
hi Underlined     term=underline cterm=underline ctermfg=5 gui=underline guifg=SlateBlue
hi Ignore         ctermfg=15 guifg=bg
hi Todo           term=standout ctermfg=0 ctermbg=11 guifg=Blue guibg=Yellow
hi link String         Constant
hi link Character      Constant
hi link Number         Constant
hi link Boolean        Constant
hi link Float          Number
hi link Function       Identifier
hi link Conditional    Statement
hi link Repeat         Statement
hi link Label          Statement
hi link Operator       Statement
hi link Keyword        Statement
hi link Exception      Statement
hi link Include        PreProc
hi link Define         PreProc
hi link Macro          PreProc
hi link PreCondit      PreProc
hi link StorageClass   Type
hi link Structure      Type
hi link Typedef        Type
hi link Tag            Special
hi link SpecialChar    Special
hi link Delimiter      Special
hi link SpecialComment Special
hi link Debug          Special
hi link cStatement     Statement
hi link cLabel         Label
hi link cConditional   Conditional
hi link cRepeat        Repeat
hi link cTodo          Todo
hi link cBadContinuation Error
hi link cSpecial       SpecialChar
hi link cFormat        cSpecial
hi link cString        String
hi link cCppString     cString
hi link cSpaceError    cError
hi link cCharacter     Character
hi link cSpecialError  cError
hi link cSpecialCharacter cSpecial
hi link cCurlyError    cError
hi link cErrInParen    cError
hi link cErrInBracket  cError
hi link cParenError    cError
hi link cIncluded      cString
hi link cCommentSkip   cComment
hi link cCommentString cString
hi link cComment2String cString
hi link cCommentStartError cError
hi link cUserLabel     Label
hi link cOctalZero     PreProc
hi link cNumber        Number
hi link cFloat         Float
hi link cOctal         Number
hi link cOctalError    cError
hi link cWrongComTail  cError
hi link cCommentL      cComment
hi link cCommentStart  cComment
hi link cComment       Comment
hi link cCommentError  cError
hi link cOperator      Operator
hi link cType          Type
hi link cTypedef       Structure
hi link cStructure     Structure
hi link cStorageClass  StorageClass
hi link cConstant      Constant
hi link cPreCondit     PreCondit
hi link cPreConditMatch cPreCondit
hi link cCppInElse2    cCppOutIf2
hi link cCppOutIf2     cCppOut
hi link cCppOutSkip    cCppOutIf2
hi link cCppOutWrapper cPreCondit
hi link cCppInWrapper  cCppOutWrapper
hi link cPreProc       PreProc
hi link cInclude       Include
hi link cDefine        Macro
hi link cError         Error
hi link cCppOut        Comment
hi link cppStatement   Statement
hi link cppAccess      cppStatement
hi link cppModifier    Type
hi link cppType        Type
hi link cppExceptions  Exception
hi link cppOperator    Operator
hi link cppCast        cppStatement
hi link cppStorageClass StorageClass
hi link cppStructure   Structure
hi link cppBoolean     Boolean
hi link cppConstant    Constant
hi link cppRawStringDelimiter Delimiter
hi link cppRawString   String
hi link cppNumber      Number
hi link cppModule      Include
