" Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (c) 2016-present Sven Greb <code@svengreb.de>

" Project: Nord Vim
" Repository: https://github.com/arcticicestudio/space-vim
" License: MIT

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "space"
let s:space_vim_version="0.8.0"
set background=dark

let s:space0_gui = "#282a36"
let s:space1_gui = "#343746"
let s:space2_gui = "#3e4154"
let s:space3_gui = "#4a4e64"
let s:space4_gui = "#e9e9e9"
let s:space5_gui = "#efefef"
let s:space6_gui = "#f9f9f9"
let s:space7_gui = "#92b3ea"
let s:space8_gui = "#a796de"
let s:space9_gui = "#79a2e7"
let s:space10_gui = "#9b88d9"
let s:space11_gui = "#ff8e91"
let s:space12_gui = "#ffac8d"
let s:space13_gui = "#ffcb8d"
let s:space14_gui = "#97d28b"
let s:space15_gui = "#ff8faa"

let s:space1_term = "0"
let s:space3_term = "8"
let s:space6_term = "6"
let s:space7_term = "4"
let s:space8_term = "5"
let s:space9_term = "2"
let s:space10_term = "3"
let s:space11_term = "1"
let s:space12_term = "7"
let s:space13_term = "11"
let s:space14_term = "14"
let s:space15_term = "15"

if !exists("g:space_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:space_italic=1
  else
    let g:space_italic=0
  endif
endif

let s:italic = "italic,"
if g:space_italic == 0
  let s:italic = ""
endif

let s:italicize_comments = ""
if exists("g:space_italic_comments")
  if g:space_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

if !exists('g:space_uniform_status_lines')
  let g:space_uniform_status_lines = 0
endif

if !exists("g:space_comment_brightness")
  let g:space_comment_brightness = 0
endif

if !exists("g:space_uniform_diff_background")
  let g:space_uniform_diff_background = 0
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
call s:hi("ColorColumn", "", s:space1_gui, "NONE", s:space1_term, "", "")
call s:hi("Cursor", s:space0_gui, s:space4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:space1_gui, "NONE", s:space1_term, "NONE", "")
call s:hi("Error", s:space11_gui, "", s:space11_term, "NONE", "", "")
call s:hi("iCursor", s:space0_gui, s:space4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:space3_gui, s:space0_gui, s:space3_term, "NONE", "", "")
call s:hi("MatchParen", s:space8_gui, s:space3_gui, s:space8_term, s:space3_term, "", "")
call s:hi("NonText", s:space2_gui, "", s:space3_term, "", "", "")
call s:hi("Normal", s:space4_gui, s:space0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:space4_gui, s:space2_gui, "NONE", s:space1_term, "NONE", "")
call s:hi("PmenuSbar", s:space4_gui, s:space2_gui, "NONE", s:space1_term, "", "")
call s:hi("PMenuSel", s:space8_gui, s:space3_gui, s:space8_term, s:space3_term, "", "")
call s:hi("PmenuThumb", s:space8_gui, s:space3_gui, "NONE", s:space3_term, "", "")
call s:hi("SpecialKey", s:space3_gui, "", s:space3_term, "", "", "")
call s:hi("SpellBad", "", s:space11_gui, "", s:space11_term, "", "")
call s:hi("SpellCap", "", s:space12_gui, "", s:space12_term, "", "")
call s:hi("SpellLocal", "", s:space12_gui, "", s:space12_term, "", "")
call s:hi("SpellRare", "", s:space12_gui, "", s:space12_term, "", "")
call s:hi("Visual", "", s:space2_gui, "", s:space1_term, "", "")
call s:hi("VisualNOS", "", s:space2_gui, "", s:space1_term, "", "")

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:space1_gui, "NONE", s:space1_term, "", "")
call s:hi("CursorLineNr", s:space3_gui, s:space0_gui, "NONE", "", "", "")
call s:hi("Folded", s:space3_gui, s:space1_gui, s:space3_term, s:space1_term, "bold", "")
call s:hi("FoldColumn", s:space3_gui, s:space0_gui, s:space3_term, "NONE", "", "")
call s:hi("SignColumn", s:space1_gui, s:space0_gui, s:space1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:space8_gui, "", s:space8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:space1_gui, "", s:space1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:space11_gui, "", s:space11_term, "NONE", "", "")
call s:hi("ModeMsg", s:space4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:space4_gui, "", "", "", "", "")
call s:hi("Question", s:space4_gui, "", "NONE", "", "", "")
if g:space_uniform_status_lines == 0
  call s:hi("StatusLine", s:space7_gui, s:space3_gui, s:space7_term, s:space3_term, "NONE", "")
  call s:hi("StatusLineNC", s:space4_gui, s:space1_gui, "NONE", s:space1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:space7_gui, s:space3_gui, s:space7_term, s:space3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:space4_gui, s:space1_gui, "NONE", s:space1_term, "NONE", "")
else
  call s:hi("StatusLine", s:space7_gui, s:space3_gui, s:space7_term, s:space3_term, "NONE", "")
  call s:hi("StatusLineNC", s:space4_gui, s:space3_gui, "NONE", s:space3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:space7_gui, s:space3_gui, s:space7_term, s:space3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:space4_gui, s:space3_gui, "NONE", s:space3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:space0_gui, s:space13_gui, s:space1_term, s:space13_term, "", "")
call s:hi("WildMenu", s:space8_gui, s:space1_gui, s:space8_term, s:space1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:space1_gui, s:space8_gui, s:space1_term, s:space8_term, "underline", "")
call s:hi("Search", s:space1_gui, s:space8_gui, s:space1_term, s:space8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:space4_gui, s:space1_gui, "NONE", s:space1_term, "NONE", "")
call s:hi("TabLineFill", s:space4_gui, s:space1_gui, "NONE", s:space1_term, "NONE", "")
call s:hi("TabLineSel", s:space8_gui, s:space3_gui, s:space8_term, s:space3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:space4_gui, "", "NONE", "", "NONE", "")
call s:hi("VertSplit", s:space2_gui, s:space1_gui, s:space3_term, s:space1_term, "NONE", "")

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:space8_gui, "", s:space8_term, "", "", "")
call s:hi("Character", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("Comment", s:space3_gui, "", s:space3_term, "", s:italicize_comments, "")
call s:hi("Conditional", s:space8_gui, "", s:space8_term, "", "", "")
call s:hi("Constant", s:space8_gui, "", s:space8_term, "", "", "")
call s:hi("Define", s:space13_gui, "", s:space13_term, "", "", "")
call s:hi("Delimiter", s:space6_gui, "", s:space6_term, "", "", "")
call s:hi("Exception", s:space11_gui, "", s:space11_term, "", "", "")
call s:hi("Float", s:space15_gui, "", s:space15_term, "", "", "")
call s:hi("Function", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("Identifier", s:space7_gui, "", s:space7_term, "", "NONE", "")
call s:hi("Include", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("Keyword", s:space14_gui, "", s:space14_term, "", "", "")
call s:hi("Label", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("Number", s:space15_gui, "", s:space15_term, "", "", "")
call s:hi("Operator", s:space12_gui, "", s:space12_term, "", "NONE", "")
call s:hi("PreProc", s:space7_gui, "", s:space7_term, "", "NONE", "")
call s:hi("Repeat", s:space8_gui, "", s:space8_term, "", "", "")
call s:hi("Special", s:space8_gui, "", s:space8_term, "", "", "")
call s:hi("SpecialChar", s:space13_gui, "", s:space13_term, "", "", "")
call s:hi("SpecialComment", s:space8_gui, "", s:space8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:space14_gui, "", s:space14_term, "", "", "")
call s:hi("StorageClass", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("String", s:space15_gui, "", s:space15_term, "", "", "")
call s:hi("Structure", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("Tag", s:space4_gui, "", "", "", "", "")
call s:hi("Todo", s:space13_gui, "NONE", s:space13_term, "NONE", "", "")
call s:hi("Type", s:space7_gui, "", s:space7_term, "", "NONE", "")
call s:hi("Typedef", s:space7_gui, "", s:space7_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("awkCharClass", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("awkPatterns", s:space9_gui, "", s:space9_term, "", "bold", "")
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

call s:hi("cIncluded", s:space7_gui, "", s:space7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("cssDefinition", s:space7_gui, "", s:space7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:space7_gui, "", s:space7_term, "", "underline", "")
call s:hi("cssStringQ", s:space7_gui, "", s:space7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:space8_gui, "", s:space8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("dtExecKey", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("dtLocaleKey", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("dtNumericKey", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("dtTypeKey", s:space7_gui, "", s:space7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:space_uniform_diff_background == 0
  call s:hi("DiffAdd", s:space14_gui, s:space0_gui, s:space14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:space13_gui, s:space0_gui, s:space13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:space11_gui, s:space0_gui, s:space11_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:space13_gui, s:space0_gui, s:space13_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:space14_gui, s:space1_gui, s:space14_term, s:space1_term, "", "")
  call s:hi("DiffChange", s:space13_gui, s:space1_gui, s:space13_term, s:space1_term, "", "")
  call s:hi("DiffDelete", s:space11_gui, s:space1_gui, s:space11_term, s:space1_term, "", "")
  call s:hi("DiffText", s:space13_gui, s:space1_gui, s:space13_term, s:space1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:space7_gui, "", s:space7_term, "", "", "")

call s:hi("goBuiltins", s:space7_gui, "", s:space7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:space3_gui, "", s:space3_term, "", "", "")
call s:hi("helpHyperTextJump", s:space8_gui, "", s:space8_term, "", "underline", "")

call s:hi("htmlArg", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("htmlLink", s:space4_gui, "", "", "", "NONE", "NONE")
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

call s:hi("javaDocTags", s:space7_gui, "", s:space7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:space7_gui, "", s:space7_term, "", "", "")

call s:hi("lessClass", s:space7_gui, "", s:space7_term, "", "", "")
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

call s:hi("markdownBlockquote", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("markdownCode", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("markdownFootnote", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("markdownId", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("markdownH1", s:space8_gui, "", s:space8_term, "", "", "")
call s:hi("markdownLinkText", s:space8_gui, "", s:space8_term, "", "", "")
call s:hi("markdownUrl", s:space4_gui, "", "NONE", "", "NONE", "")
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

call s:hi("perlPackageDecl", s:space7_gui, "", s:space7_term, "", "", "")

call s:hi("phpClasses", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("phpDocTags", s:space7_gui, "", s:space7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("podVerbatimLine", s:space4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("rubySymbol", s:space6_gui, "", s:space6_term, "", "bold", "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("sassClass", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("sassId", s:space7_gui, "", s:space7_term, "", "underline", "")
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

call s:hi("vimAugroup", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("vimMapRhs", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("vimNotation", s:space7_gui, "", s:space7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("xmlCdataStart", s:space3_gui, "", s:space3_term, "", "bold", "")
call s:hi("xmlNamespace", s:space7_gui, "", s:space7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:space7_gui, "", s:space7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:space13_gui, "", s:space13_term, "", "", "")
call s:hi("ALEErrorSign" , s:space11_gui, "", s:space11_term, "", "", "")

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:space14_gui, "", s:space14_term, "", "", "")
call s:hi("GitGutterChange", s:space13_gui, "", s:space13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:space11_gui, "", s:space11_term, "", "", "")
call s:hi("GitGutterDelete", s:space11_gui, "", s:space11_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:space14_gui, "", s:space14_term, "", "", "")
call s:hi("SignifySignChange", s:space13_gui, "", s:space13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:space11_gui, "", s:space11_term, "", "", "")
call s:hi("SignifySignDelete", s:space11_gui, "", s:space11_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:space11_gui, "", s:space11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:space11_gui, "", s:space11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:space14_gui, "", s:space14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:space4_gui, s:space3_gui, "", s:space3_term, "", "")
call s:hi("jediFat", s:space8_gui, s:space3_gui, s:space8_term, s:space3_term, "bold,underline", "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:space7_gui, "", s:space7_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:space11_gui, "", "", s:space11_term, "", "")

"+--- Languages ---+
" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:space8_gui, "", s:space8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:space7_gui, "", s:space7_term, "", "", "")
call s:hi("mkdFootnote", s:space8_gui, "", s:space8_term, "", "", "")
call s:hi("mkdRule", s:space10_gui, "", s:space10_term, "", "", "")
call s:hi("mkdLineBreak", s:space9_gui, "", s:space9_term, "", "", "")
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

