set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "snazzyfied"

" Color Map (GUI vs 256color)
let s:snazzyColorMap = {
\  "background":   {"gui": "#282a36", "term": 235 },
\  "dark":         {"gui": "#282a36", "term": 235 },
\  "dark1":        {"gui": "#444444", "term": 238 },
\  "grey":         {"gui": "#555555", "term": 240 },
\  "grey2":        {"gui": "#777777", "term": 243 },
\  "grey3":        {"gui": "#808080", "term": 244 },
\  "grey4":        {"gui": "#afafaf", "term": 145 },
\  "grey5":        {"gui": "#6a6d81", "term": 237 },
\  "darkgrey":     {"gui": "#1D1F28", "term": 234 },
\  "lightgrey":    {"gui": "#dee1db", "term": 188 },
\  "green":        {"gui": "#50FB7C", "term": 84  },
\  "orange":       {"gui": "#FF9F43", "term": 215 },
\  "darkorange":   {"gui": "#af5f00", "term": 130 },
\  "brightorange": {"gui": "#ff6600", "term": 202 },
\  "red":          {"gui": "#fc4346", "term": 203 },
\  "magenta":      {"gui": "#FC75C5", "term": 206 },
\  "lightmagenta": {"gui": "#f488c7", "term": 212 },
\  "blue":         {"gui": "#57c7ff", "term": 81  },
\  "lightblue":    {"gui": "#a6e2ff", "term": 153 },
\  "cyan":         {"gui": "#9aedfe", "term": 51  },
\  "yellow":       {"gui": "#f0fb8c", "term": 228 },
\  "white":        {"gui": "#f0f0f0", "term": 255 },
\}

if exists("g:snazzyfiedTerminal") && g:snazzyfiedTerminal
  let s:snazzyColorMap.green.term = "green"
  let s:snazzyColorMap.yellow.term = "yellow"
  let s:snazzyColorMap.background.term = "None"
endif

" Get the color (String color [, String vimMode])
function! s:col(color, ...)
  return s:snazzyColorMap[a:color][get(a:, "1", "gui")]
endfunction

" Call hilight
function! Snazzy(hiKey, params)
  let l:cmd = "hi " . a:hiKey
  
  for key in keys(a:params)
    " echo call("s:col", a:params[key])
    let l:cmd .= " gui" . key . "=" . s:col(a:params[key])
      \ . " cterm" . key . "=" . s:col(a:params[key], "term")
  endfor
  
  exec l:cmd
endfunction

hi Character gui=None
" hi Normal guifg=#dee1db guibg=#282a36
call Snazzy("Normal",      { "fg": "lightgrey", "bg": "background" })

call Snazzy("String",      { "fg": "green" })
call Snazzy("Number",      { "fg": "orange" })
call Snazzy("Float",       { "fg": "orange" })
call Snazzy("Number",      { "fg": "orange" })
call Snazzy("Constant",    { "fg": "orange" })
call Snazzy("Boolean",     { "fg": "orange" })

call Snazzy("Function",    { "fg": "lightblue" })
call Snazzy("Keyword",     { "fg": "magenta" })
call Snazzy("Statement",   { "fg": "magenta" })

call Snazzy("Comment",     { "fg": "grey3" })
call Snazzy("Title",       { "fg": "white" })
call Snazzy("Underlined",  { "fg": "yellow" })

call Snazzy("Operator",    { "fg": "lightmagenta" })
call Snazzy("Conditional", { "fg": "lightmagenta" })
call Snazzy("Include",     { "fg": "lightmagenta" })
call Snazzy("Macro",       { "fg": "lightmagenta" })
call Snazzy("PreCondit",   { "fg": "lightmagenta" })
call Snazzy("PreProc",     { "fg": "lightmagenta" })
call Snazzy("Todo",        { "fg": "lightmagenta" })

call Snazzy("Delimiter",   { "fg": "grey" })
call Snazzy("Special",     { "fg": "cyan" })
call Snazzy("Type",        { "fg": "cyan" })
call Snazzy("SpecialKey",  { "fg": "dark1" })

call Snazzy("DiffAdd",     { "fg": "green" })
call Snazzy("DiffChange",  { "fg": "blue" })
call Snazzy("DiffDelete",  { "fg": "red" })

" hi DiffAdd guifg=#50FB7C ctermfg=Green
" hi DiffChange gui=None
" hi DiffDelete guifg=#FC4346 ctermfg=Red
hi link DiffText Normal


" Vim editor tools
call Snazzy("Search",      { "bg": "darkorange" })
call Snazzy("IncSearch",   { "fg": "white", "bg": "brightorange" })
call Snazzy("LineNr",      { "fg": "grey3", "bg": "dark" })
call Snazzy("Cursor",      { "fg": "grey3" })
call Snazzy("iCursor",     { "fg": "grey3" })
call Snazzy("CursorLine",  { "bg": "grey5" })
call Snazzy("MatchParen",  { "bg": "lightblue" })

call Snazzy("FoldColumn",   { "fg": "grey" })
call Snazzy("Folded",       { "fg": "grey5" })
call Snazzy("Identifier",   { "fg": "lightblue" })
call Snazzy("ModeMsg",      { "fg": "yellow" })
call Snazzy("NonText",      { "fg": "dark" })
call Snazzy("StatusLine",   { "fg": "grey2", "bg": "dark" })
call Snazzy("StatusLineNC", { "fg": "grey",  "bg": "darkgrey" })
call Snazzy("TabLine",      { "fg": "yellow" })
call Snazzy("TabLineSel",   { "fg": "orange" })

hi CursorLine gui=None cterm=None
" hi Search guibg=#875444
" hi IncSearch guibg=#af6d2e

""" Syntax improvmenets

" sh overrides
call Snazzy("shDoubleQuote", { "fg": "green" })
call Snazzy("shSingleQuote", { "fg": "green" })

" vimscript overrides
call Snazzy("vimFunction",  { "fg": "blue" })
call Snazzy("vimUserFunc",  { "fg": "blue" })
call Snazzy("vimFuncKey",   { "fg": "magenta" })
call Snazzy("vimNotFunc",   { "fg": "magenta" })
call Snazzy("vimCommand",   { "fg": "magenta" })
call Snazzy("vimIsCommand", { "fg": "magenta" })
call Snazzy("vimSyntax",    { "fg": "yellow" })
call Snazzy("vimLet",       { "fg": "yellow" })
call Snazzy("vimSet",       { "fg": "yellow" })

" hi Conditional guifg=#f488c7
"hi Constant guifg=#ff9f43
" hi Keyword gui=None
" hi Comment guifg=#555555
" hi Include guifg=#f488c7
hi Define gui=None
" hi Delimiter guifg=#555555
" hi Operator guifg=#f488c7
" hi Macro guifg=#f488c7

" hi PreCondit guifg=#f488c7
" hi PreProc guifg=#FC75C5
" hi Special guifg=#9aedfe
hi SpecialChar gui=None
hi SpecialComment gui=None
" hi SpecialKey guifg=#393b4c
" hi Statement guifg=#ff6ac1
hi StorageClass gui=None
hi Structure gui=None
" hi Title guifg=white
" hi Todo guifg=#f488c7
" hi Type guifg=#9aedfe
hi Typedef gui=None
"hi link Boolean Constant
"hi link Float Number

" hi Normal guifg=#dee1db guibg=#282a36 ctermfg=188 ctermbg=None
" hi Cursor guibg=#6a6d81
" hi iCursor guibg=#6a6d81
hi CursorIM gui=None
" hi CursorLine guibg=#6a6d81 ctermbg=237 gui=None cterm=None
" hi MatchParen guibg=#181921
" hi Debug           guifg=#BCA3A3               gui=bold
hi link CursorColumn Normal
hi link VertSplit ModeMsg

hi Directory gui=None
hi Error gui=None
hi ErrorMsg gui=None
hi Exception gui=None
" hi FoldColumn guifg=#494c62
" hi Folded guifg=#6a6d81
" hi Identifier guifg=#777777
hi Ignore gui=None
hi Repeat gui=None
" hi Search guibg=#875444
" hi IncSearch guibg=#af6d2e

hi Label gui=None
" hi LineNr guifg=#777777 guibg=#1D1F28 ctermfg=145 ctermbg=237
" hi ModeMsg guifg=#F0FB8C
hi MoreMsg gui=None
" hi NonText guifg=#393b4c
hi Pmenu gui=None
hi PmenuSbar gui=None
hi PmenuSel gui=None
hi PmenuThumb gui=None
hi Question gui=None
hi SignColumn gui=None
hi SpellBad gui=None
hi SpellCap gui=None
hi SpellLocal gui=None
hi SpellRare gui=None

" hi StatusLine guifg=#777777 guibg=#181921
" hi StatusLineNC guifg=#555555 guibg=#1D1F28
" hi TabLine guifg=#F0FB8C
hi TabLineFill gui=None
" hi TabLineSel guifg=#ff9f43
hi Tag gui=None
" hi Underlined guifg=lightyellow
hi Visual gui=None
hi VisualNOS gui=None
hi WarningMsg gui=None
hi WildMenu gui=None

set background=dark
