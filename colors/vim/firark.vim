if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "firark"
let s:firark_vim_version="0.8.0"
set background=dark

let s:firark0_gui = "#282a36"
let s:firark1_gui = "#343746"
let s:firark2_gui = "#3e4154"
let s:firark3_gui = "#4a4e64"
let s:firark4_gui = "#e9e9e9"
let s:firark5_gui = "#efefef"
let s:firark6_gui = "#f9f9f9"
let s:firark7_gui = "#92b3ea"
let s:firark8_gui = "#a796de"
let s:firark9_gui = "#79a2e7"
let s:firark10_gui = "#9b88d9"
let s:firark11_gui = "#ff8e91"
let s:firark12_gui = "#ffac8d"
let s:firark13_gui = "#ffcb8d"
let s:firark14_gui = "#97d28b"
let s:firark15_gui = "#ff8faa"

let s:firark1_term = "0"
let s:firark3_term = "8"
let s:firark6_term = "6"
let s:firark7_term = "4"
let s:firark8_term = "5"
let s:firark9_term = "2"
let s:firark10_term = "3"
let s:firark11_term = "1"
let s:firark12_term = "7"
let s:firark13_term = "11"
let s:firark14_term = "14"
let s:firark15_term = "15"

if !exists("g:firark_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:firark_italic=1
  else
    let g:firark_italic=0
  endif
endif

let s:italic = "italic,"
if g:firark_italic == 0
  let s:italic = ""
endif

let s:italicize_comments = ""
if exists("g:firark_italic_comments")
  if g:firark_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

if !exists('g:firark_uniform_status_lines')
  let g:firark_uniform_status_lines = 0
endif

if !exists("g:firark_comment_brightness")
  let g:firark_comment_brightness = 0
endif

if !exists("g:firark_uniform_diff_background")
  let g:firark_uniform_diff_background = 0
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", "bold", "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", "underline", "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:firark1_gui, "NONE", s:firark1_term, "", "")
call s:hi("Cursor", s:firark0_gui, s:firark4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:firark1_gui, "NONE", s:firark1_term, "NONE", "")
call s:hi("Error", s:firark11_gui, "", s:firark11_term, "NONE", "", "")
call s:hi("iCursor", s:firark0_gui, s:firark4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:firark3_gui, s:firark0_gui, s:firark3_term, "NONE", "", "")
call s:hi("MatchParen", s:firark8_gui, s:firark3_gui, s:firark8_term, s:firark3_term, "", "")
call s:hi("NonText", s:firark2_gui, "", s:firark3_term, "", "", "")
call s:hi("Normal", s:firark4_gui, s:firark0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:firark4_gui, s:firark2_gui, "NONE", s:firark1_term, "NONE", "")
call s:hi("PmenuSbar", s:firark4_gui, s:firark2_gui, "NONE", s:firark1_term, "", "")
call s:hi("PMenuSel", s:firark8_gui, s:firark3_gui, s:firark8_term, s:firark3_term, "", "")
call s:hi("PmenuThumb", s:firark8_gui, s:firark3_gui, "NONE", s:firark3_term, "", "")
call s:hi("SpecialKey", s:firark3_gui, "", s:firark3_term, "", "", "")
call s:hi("SpellBad", "", s:firark11_gui, "", s:firark11_term, "", "")
call s:hi("SpellCap", "", s:firark12_gui, "", s:firark12_term, "", "")
call s:hi("SpellLocal", "", s:firark12_gui, "", s:firark12_term, "", "")
call s:hi("SpellRare", "", s:firark12_gui, "", s:firark12_term, "", "")
call s:hi("Visual", "", s:firark2_gui, "", s:firark1_term, "", "")
call s:hi("VisualNOS", "", s:firark2_gui, "", s:firark1_term, "", "")

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:firark1_gui, "NONE", s:firark1_term, "", "")
call s:hi("CursorLineNr", s:firark3_gui, s:firark0_gui, "NONE", "", "", "")
call s:hi("Folded", s:firark3_gui, s:firark1_gui, s:firark3_term, s:firark1_term, "bold", "")
call s:hi("FoldColumn", s:firark3_gui, s:firark0_gui, s:firark3_term, "NONE", "", "")
call s:hi("SignColumn", s:firark1_gui, s:firark0_gui, s:firark1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:firark8_gui, "", s:firark8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:firark1_gui, "", s:firark1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:firark11_gui, "", s:firark11_term, "NONE", "", "")
call s:hi("ModeMsg", s:firark4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:firark4_gui, "", "", "", "", "")
call s:hi("Question", s:firark4_gui, "", "NONE", "", "", "")
if g:firark_uniform_status_lines == 0
  call s:hi("StatusLine", s:firark7_gui, s:firark3_gui, s:firark7_term, s:firark3_term, "NONE", "")
  call s:hi("StatusLineNC", s:firark4_gui, s:firark1_gui, "NONE", s:firark1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:firark7_gui, s:firark3_gui, s:firark7_term, s:firark3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:firark4_gui, s:firark1_gui, "NONE", s:firark1_term, "NONE", "")
else
  call s:hi("StatusLine", s:firark7_gui, s:firark3_gui, s:firark7_term, s:firark3_term, "NONE", "")
  call s:hi("StatusLineNC", s:firark4_gui, s:firark3_gui, "NONE", s:firark3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:firark7_gui, s:firark3_gui, s:firark7_term, s:firark3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:firark4_gui, s:firark3_gui, "NONE", s:firark3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:firark0_gui, s:firark13_gui, s:firark1_term, s:firark13_term, "", "")
call s:hi("WildMenu", s:firark8_gui, s:firark1_gui, s:firark8_term, s:firark1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:firark1_gui, s:firark8_gui, s:firark1_term, s:firark8_term, "underline", "")
call s:hi("Search", s:firark1_gui, s:firark8_gui, s:firark1_term, s:firark8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:firark4_gui, s:firark1_gui, "NONE", s:firark1_term, "NONE", "")
call s:hi("TabLineFill", s:firark4_gui, s:firark1_gui, "NONE", s:firark1_term, "NONE", "")
call s:hi("TabLineSel", s:firark8_gui, s:firark3_gui, s:firark8_term, s:firark3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:firark4_gui, "", "NONE", "", "NONE", "")
call s:hi("VertSplit", s:firark2_gui, s:firark1_gui, s:firark3_term, s:firark1_term, "NONE", "")

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:firark8_gui, "", s:firark8_term, "", "", "")
call s:hi("Character", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("Comment", s:firark3_gui, "", s:firark3_term, "", s:italicize_comments, "")
call s:hi("Conditional", s:firark8_gui, "", s:firark8_term, "", "", "")
call s:hi("Constant", s:firark8_gui, "", s:firark8_term, "", "", "")
call s:hi("Define", s:firark13_gui, "", s:firark13_term, "", "", "")
call s:hi("Delimiter", s:firark6_gui, "", s:firark6_term, "", "", "")
call s:hi("Exception", s:firark11_gui, "", s:firark11_term, "", "", "")
call s:hi("Float", s:firark15_gui, "", s:firark15_term, "", "", "")
call s:hi("Function", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("Identifier", s:firark7_gui, "", s:firark7_term, "", "NONE", "")
call s:hi("Include", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("Keyword", s:firark14_gui, "", s:firark14_term, "", "", "")
call s:hi("Label", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("Number", s:firark15_gui, "", s:firark15_term, "", "", "")
call s:hi("Operator", s:firark12_gui, "", s:firark12_term, "", "NONE", "")
call s:hi("PreProc", s:firark7_gui, "", s:firark7_term, "", "NONE", "")
call s:hi("Repeat", s:firark8_gui, "", s:firark8_term, "", "", "")
call s:hi("Special", s:firark8_gui, "", s:firark8_term, "", "", "")
call s:hi("SpecialChar", s:firark13_gui, "", s:firark13_term, "", "", "")
call s:hi("SpecialComment", s:firark8_gui, "", s:firark8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:firark14_gui, "", s:firark14_term, "", "", "")
call s:hi("StorageClass", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("String", s:firark15_gui, "", s:firark15_term, "", "", "")
call s:hi("Structure", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("Tag", s:firark4_gui, "", "", "", "", "")
call s:hi("Todo", s:firark13_gui, "NONE", s:firark13_term, "NONE", "", "")
call s:hi("Type", s:firark7_gui, "", s:firark7_term, "", "NONE", "")
call s:hi("Typedef", s:firark7_gui, "", s:firark7_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("awkCharClass", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("awkPatterns", s:firark9_gui, "", s:firark9_term, "", "bold", "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", s:firark7_gui, "", s:firark7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("cssDefinition", s:firark7_gui, "", s:firark7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:firark7_gui, "", s:firark7_term, "", "underline", "")
call s:hi("cssStringQ", s:firark7_gui, "", s:firark7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:firark8_gui, "", s:firark8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("dtExecKey", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("dtLocaleKey", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("dtNumericKey", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("dtTypeKey", s:firark7_gui, "", s:firark7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:firark_uniform_diff_background == 0
  call s:hi("DiffAdd", s:firark14_gui, s:firark0_gui, s:firark14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:firark13_gui, s:firark0_gui, s:firark13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:firark11_gui, s:firark0_gui, s:firark11_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:firark13_gui, s:firark0_gui, s:firark13_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:firark14_gui, s:firark1_gui, s:firark14_term, s:firark1_term, "", "")
  call s:hi("DiffChange", s:firark13_gui, s:firark1_gui, s:firark13_term, s:firark1_term, "", "")
  call s:hi("DiffDelete", s:firark11_gui, s:firark1_gui, s:firark11_term, s:firark1_term, "", "")
  call s:hi("DiffText", s:firark13_gui, s:firark1_gui, s:firark13_term, s:firark1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:firark7_gui, "", s:firark7_term, "", "", "")

call s:hi("goBuiltins", s:firark7_gui, "", s:firark7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:firark3_gui, "", s:firark3_term, "", "", "")
call s:hi("helpHyperTextJump", s:firark8_gui, "", s:firark8_term, "", "underline", "")

call s:hi("htmlArg", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("htmlLink", s:firark4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:firark7_gui, "", s:firark7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:firark7_gui, "", s:firark7_term, "", "", "")

call s:hi("lessClass", s:firark7_gui, "", s:firark7_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("markdownCode", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("markdownFootnote", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("markdownId", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("markdownH1", s:firark8_gui, "", s:firark8_term, "", "", "")
call s:hi("markdownLinkText", s:firark8_gui, "", s:firark8_term, "", "", "")
call s:hi("markdownUrl", s:firark4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:firark7_gui, "", s:firark7_term, "", "", "")

call s:hi("phpClasses", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("phpDocTags", s:firark7_gui, "", s:firark7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("podVerbatimLine", s:firark4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("rubySymbol", s:firark6_gui, "", s:firark6_term, "", "bold", "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("sassClass", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("sassId", s:firark7_gui, "", s:firark7_term, "", "underline", "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("vimMapRhs", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("vimNotation", s:firark7_gui, "", s:firark7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("xmlCdataStart", s:firark3_gui, "", s:firark3_term, "", "bold", "")
call s:hi("xmlNamefirark", s:firark7_gui, "", s:firark7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:firark7_gui, "", s:firark7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:firark13_gui, "", s:firark13_term, "", "", "")
call s:hi("ALEErrorSign" , s:firark11_gui, "", s:firark11_term, "", "", "")

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:firark14_gui, "", s:firark14_term, "", "", "")
call s:hi("GitGutterChange", s:firark13_gui, "", s:firark13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:firark11_gui, "", s:firark11_term, "", "", "")
call s:hi("GitGutterDelete", s:firark11_gui, "", s:firark11_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:firark14_gui, "", s:firark14_term, "", "", "")
call s:hi("SignifySignChange", s:firark13_gui, "", s:firark13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:firark11_gui, "", s:firark11_term, "", "", "")
call s:hi("SignifySignDelete", s:firark11_gui, "", s:firark11_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:firark11_gui, "", s:firark11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:firark11_gui, "", s:firark11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:firark14_gui, "", s:firark14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:firark4_gui, s:firark3_gui, "", s:firark3_term, "", "")
call s:hi("jediFat", s:firark8_gui, s:firark3_gui, s:firark8_term, s:firark3_term, "bold,underline", "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:firark7_gui, "", s:firark7_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:firark11_gui, "", "", s:firark11_term, "", "")

"+--- Languages ---+
" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:firark8_gui, "", s:firark8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:firark7_gui, "", s:firark7_term, "", "", "")
call s:hi("mkdFootnote", s:firark8_gui, "", s:firark8_term, "", "", "")
call s:hi("mkdRule", s:firark10_gui, "", s:firark10_term, "", "", "")
call s:hi("mkdLineBreak", s:firark9_gui, "", s:firark9_term, "", "", "")
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

