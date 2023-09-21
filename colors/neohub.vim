" Vim color file
" Name: Neohub
" Author: hanckedd
" License: MIT

set background=dark
highlight clear

if exists('syntax_on')
  syntax reset
endif


let g:colors_name = 'neohub'


let cOperatorList  = '[-&|+<>=*/!~]'    " A list of symbols that we don't want to immediately precede the operator
let cOperatorList .= '\@<!'             " Negative look-behind (check that the preceding symbols aren't there)
let cOperatorList .= '\%('              " Beginning of a list of possible operators
let cOperatorList .=     '\('           " First option, the following symbols...
let cOperatorList .=        '[-&|+<>=]'
let cOperatorList .=     '\)'
let cOperatorList .=     '\1\?'         " Followed by (optionally) the exact same symbol, so -, --, =, ==, &, && etc
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '->'           " Pointer dereference operator
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '[-+*/%&^|!]=' " One of the listed symbols followed by an =, e.g. +=, -=, &= etc
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '[*?,!~%]'     " Some simple single character operators
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '\('           " One of the shift characters:
let cOperatorList .=         '[<>]'     
let cOperatorList .=     '\)'
let cOperatorList .=     '\2'           " Followed by another identical character, so << or >>...
let cOperatorList .=     '='            " Followed by =, so <<= or >>=.
let cOperatorList .= '\)'               " End of the long list of options
let cOperatorList .= '[-&|+<>=*/!~]'    " The list of symbols that we don't want to follow
let cOperatorList .= '\@!'              " Negative look-ahead (this and the \@<! prevent === etc from matching)
exe "syn match cOperator display '" . cOperatorList . "'"
syn match cOperator display ';'

" General colors"{{{
hi ColorColumn ctermfg=NONE ctermbg=97 cterm=NONE guifg=NONE guibg=#nb5ac6 gui=NONE
hi Conceal ctermfg=119 ctermbg=NONE cterm=NONE guifg=#22b996 guibg=NONE gui=NONE
hi Cursor ctermfg=16 ctermbg=119 cterm=NONE guifg=#000000 guibg=#22b996 gui=NONE
hi Cursor2 ctermfg=16 ctermbg=119 cterm=NONE guifg=#000000 guibg=#22b996 gui=NONE
hi CursorIM ctermfg=NONE ctermbg=168 cterm=NONE guifg=NONE guibg=#ff55a3 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#2a3138 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#2a3138 gui=NONE
hi Directory ctermfg=156 ctermbg=NONE cterm=NONE guifg=#22b996 guibg=NONE gui=NONE
hi DiffAdd ctermfg=16 ctermbg=156 cterm=NONE guifg=#000000 guibg=#22b996 gui=NONE
hi DiffChange ctermfg=16 ctermbg=175 cterm=NONE guifg=#000000 guibg=#ff55a3 gui=NONE
hi DiffDelete ctermfg=156 ctermbg=NONE cterm=NONE guifg=#22b996 guibg=NONE gui=NONE
hi DiffText ctermfg=16 ctermbg=168 cterm=bold guifg=#000000 guibg=#ff55a3 gui=bold
hi EndOfBuffer ctermfg=119 ctermbg=NONE cterm=NONE guifg=#22b996 guibg=NONE gui=NONE
hi ErrorMsg ctermfg=168 ctermbg=NONE cterm=bold guifg=#ff55a3 guibg=#2b1211 gui=bold
hi VertSplit ctermfg=97 ctermbg=NONE cterm=NONE guifg=#22b996 guibg=NONE gui=NONE
hi Folded ctermfg=97 ctermbg=235 cterm=bold guifg=#db5ac6 guibg=#2a3138 gui=bold
hi FoldColumn ctermfg=97 ctermbg=NONE cterm=bold guifg=#db5ac6 guibg=NONE gui=bold
hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi IncSearch ctermfg=16 ctermbg=119 cterm=bold guifg=#000000 guibg=#22b996 gui=bold
hi LineNr ctermfg=240 ctermbg=233 cterm=NONE guifg=#656475 guibg=NONE gui=NONE
hi CursorLineNr ctermfg=102 ctermbg=16 cterm=bold guifg=#8c8b98 guibg=NONE gui=bold
hi MatchParen ctermfg=15 ctermbg=240 cterm=bold guifg=#d3d3d3 guibg=#585858 gui=bold
hi ModeMsg ctermfg=119 ctermbg=NONE cterm=bold guifg=#22b996 guibg=NONE gui=bold
hi MoreMsg ctermfg=119 ctermbg=NONE cterm=bold guifg=#22b996 guibg=NONE gui=bold
hi NonText ctermfg=234 ctermbg=NONE cterm=NONE guifg=#4c566a guibg=NONE gui=NONE
hi Normal ctermfg=252 ctermbg=NONE cterm=NONE guifg=#ccd2d9 guibg=#1e2935 gui=NONE
hi NormalFloat ctermfg=252 ctermbg=16 cterm=NONE guifg=#ccd2d9 guibg=#3b3847 gui=NONE
hi Pmenu ctermfg=119 ctermbg=16 cterm=NONE guifg=#22b996 guibg=#2a3138 gui=NONE
hi PmenuSel ctermfg=16 ctermbg=119 cterm=NONE guifg=#000000 guibg=#22b996 gui=NONE
hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=#2c2a35 gui=NONE
hi PmenuThumb ctermfg=NONE ctermbg=119 cterm=NONE guifg=NONE guibg=#db5ac6 gui=NONE
hi Question ctermfg=119 ctermbg=NONE cterm=underline guifg=#db5ac6 guibg=NONE gui=underline
hi Search ctermfg=16 ctermbg=75 cterm=bold guifg=#000000 guibg=#db5ac6 gui=bold
hi SpecialKey ctermfg=97 ctermbg=NONE cterm=NONE guifg=#db5ac6 guibg=NONE gui=NONE
hi SpellBad ctermfg=168 ctermbg=NONE cterm=underline guifg=#ff55a3 guibg=NONE gui=underline
hi SpellCap ctermfg=168 ctermbg=NONE cterm=underline guifg=#ff55a3 guibg=NONE gui=underline
hi SpellLocal ctermfg=168 ctermbg=NONE cterm=underline guifg=#ff55a3 guibg=NONE gui=underline
hi SpellRare ctermfg=168 ctermbg=NONE cterm=underline guifg=#ff55a3 guibg=NONE gui=underline
hi StatusLine ctermfg=63 ctermbg=16 cterm=NONE guifg=#22b996 guibg=#272D33 gui=NONE
hi StatusLineNC ctermfg=240 ctermbg=16 cterm=NONE guifg=#db5ac6 guibg=#272D33 gui=NONE
hi TabLine ctermfg=102 ctermbg=16 cterm=NONE guifg=#a1a0ad guibg=#1e2935 gui=NONE
hi TabLineFill ctermfg=102 ctermbg=16 cterm=NONE guifg=#a1a0ad guibg=NONE gui=NONE
hi TabLineSel ctermfg=63 ctermbg=NONE cterm=NONE guifg=#3d434d guibg=#22b996 gui=NONE
hi Title ctermfg=168 ctermbg=NONE cterm=bold guifg=#ff55a3 guibg=NONE gui=bold
hi Visual ctermfg=NONE ctermbg=97 cterm=bold guifg=#000000 guibg=#db5ac6 gui=bold
hi WarningMsg ctermfg=226 ctermbg=NONE cterm=bold guifg=#e56d28 guibg=#2b2a11 gui=bold
hi WildMenu ctermfg=119 ctermbg=NONE cterm=NONE guifg=#ff55a3 guibg=NONE gui=NONE
"}}}
" Syntax highlighting"{{{
hi Comment ctermfg=102 ctermbg=NONE cterm=NONE guifg=#4c566a guibg=NONE gui=NONE
hi Constant ctermfg=208 ctermbg=NONE cterm=NONE guifg=#e56d28 guibg=NONE gui=NONE
hi String ctermfg=183 ctermbg=NONE cterm=NONE guifg=#2f52a7 guibg=NONE gui=NONE
hi Number ctermfg=208 ctermbg=NONE cterm=NONE guifg=#e56d28 guibg=NONE gui=NONE
hi PreProc ctermfg=129 ctermbg=NONE cterm=NONE guifg=#a62163 guibg=NONE gui=NONE
hi Identifier ctermfg=75 ctermbg=NONE cterm=NONE guifg=#5b93b3 guibg=NONE gui=NONE
hi Function ctermfg=156 ctermbg=NONE cterm=NONE guifg=#268bae guibg=NONE gui=NONE
hi Statement ctermfg=63 ctermbg=NONE cterm=NONE guifg=#a62163 guibg=NONE gui=NONE
hi Type ctermfg=75 ctermbg=NONE cterm=NONE guifg=#db5ac6 guibg=NONE gui=NONE
hi Special ctermfg=208 ctermbg=NONE cterm=NONE guifg=#e56d28 guibg=NONE gui=NONE
hi DiagnosticError ctermfg=168 ctermbg=NONE cterm=NONE guifg=#9a3983 guibg=#2b1211 gui=NONE
hi DiagnosticWarn ctermfg=226 ctermbg=NONE cterm=NONE guifg=#bf8e3b guibg=#2b2a11 gui=NONE
hi DiagnosticInfo ctermfg=24 ctermbg=NONE cterm=NONE guifg=#5b93b3 guibg=#162c2e gui=NONE
hi Underlined ctermfg=119 ctermbg=NONE cterm=underline guifg=#22b996 guibg=NONE gui=underline
hi Error ctermfg=168 ctermbg=NONE cterm=underline guifg=#9a3983 guibg=NONE gui=underline
hi Todo ctermfg=168 ctermbg=NONE cterm=bold guifg=#9a3983 guibg=#2b1211 gui=bold
"hi Ignore
hi link Character String
hi link Boolean Constant
hi link Float Number
hi link Conditional Statement
hi link Repeat Statement
hi link Operator Statement
hi link Keyword Statement
hi link Label Statement
hi link Exception Statement
hi link Include Preproc
hi link Define Statement
hi link Macro PreProc
hi link PreCondit PreProc
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi link SpecialChar Special
hi link Tag Special
hi link Delimiter Statement
hi link SpecialComment Special
hi link Debug Special
"}}}
" HTML"{{{
hi link htmlTag PreProc
hi link htmlEndTag PreProc
hi link htmlTitle Number
hi link htmlH1 Number
hi htmlLink ctermfg=156 ctermbg=NONE cterm=underline guifg=#22b996 guibg=NONE gui=underline
"}}}
" XML"{{{
hi link xmlEndTag Keyword
"}}}
" Javascript"{{{
hi link javaScriptIdentifier Type
hi link javaScriptDOMMethods Normal
hi link javaScriptDOMProperties Normal
hi link javaScriptNumber Number
hi link javaScriptParens Preproc
hi link javaScriptFuncArg Normal
hi javaScriptFuncDef ctermfg=168 ctermbg=NONE cterm=NONE guifg=#9a3983 guibg=NONE gui=NONE
"}}}
" TypeScript{{{
hi link typescriptTemplateSB Number
"}}}
" Ruby"{{{
hi link rubyControl Preproc
hi link rubyException Preproc
hi link rubyExceptionHandler Preproc
"}}}
" eruby"{{{
hi link erubyDelimiter Special
"}}}
" Python"{{{
hi link pythonBuiltin Type
hi link pythonDecorator PreProc
hi link pythonDecoratorName PreProc
"}}}
" cpp"{{{
hi link cOperator Preproc
"}}}
" php"{{{
hi link phpParent Normal
"}}}
" go"{{{
hi link goDeclType Preproc
"}}}
" Markdown"{{{
hi def link markdownItalic NONE
hi def link markdownBoldItalic NONE
"}}}
" vim-gitgutter"{{{
hi GitGutterAdd ctermfg=156 ctermbg=NONE cterm=bold guifg=#22b996 guibg=NONE gui=bold
hi GitGutterChange ctermfg=208 ctermbg=NONE cterm=bold guifg=#e56d28 guibg=NONE gui=bold
hi GitGutterDelete ctermfg=168 ctermbg=NONE cterm=bold guifg=#9a3983 guibg=NONE gui=bold
"}}}
" coc{{{
hi CocHintSign ctermfg=60 guifg=#6d7ba6
"}}}
" vim-lsp{{{
hi LspErrorText ctermfg=168 ctermbg=NONE cterm=NONE guifg=#9a3983 guibg=#2b1211 gui=NONE
hi LspErrorHighlight cterm=undercurl gui=undercurl guisp=#9a3983
hi LspErrorVirtualText ctermfg=168 ctermbg=NONE cterm=NONE guifg=#9a3983 guibg=#2b1211 gui=NONE
hi LspWarningText ctermfg=142 ctermbg=NONE cterm=NONE guifg=#bf8e3b guibg=#2b2a11 gui=NONE
hi LspWarningHighlight cterm=undercurl gui=undercurl guisp=#bf8e3b
hi LspWarningVirtualText ctermfg=142 ctermbg=NONE cterm=NONE guifg=#bf8e3b guibg=#2b2a11 gui=NONE
hi LspInformationText ctermfg=24 ctermbg=NONE cterm=NONE guifg=#5b93b3 guibg=#162c2e gui=NONE
hi LspInformationHighlight cterm=undercurl gui=undercurl guisp=#5b93b3
hi LspInformationVirtualText ctermfg=24 ctermbg=NONE cterm=NONE guifg=#5b93b3 guibg=#162c2e gui=NONE
"}}}
