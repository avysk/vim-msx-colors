" Copyright (c) 2023-present Alexey Vyskubov <alexey@ocaml.nl>
" This source code is licensed under the 2-clauso BSD license found in the license file.

hi! clear
syntax reset

let g:colors_name = "msx"
let s:msx_vim_version="0.10.0"
set background=light

let s:color1 = "#000000" " black
let s:color2 = "#3EB849" " medium green
let s:color3 = "#74D07D" " light green
let s:color4 = "#5955E0" " dark blue
let s:color5 = "#8076F1" " light blue
let s:color6 = "#B95E51" " dark red
let s:color7 = "#65DBEF" " cyan
let s:color8 = "#DB6559" " medium red
let s:color9 = "#FF897D" " light red
let s:color10 = "#CCC35E" " dark yellow
let s:color11 = "#DED087" " light yellow
let s:color12 = "#3AA241" " dark green
let s:color13 = "#B766B5" " magenta
let s:color14 = "#CCCCCC" " gray
let s:color15 = "#FFFFFF" " white

let g:msxcolors = {
\  1: s:color1,
\  2: s:color2,
\  3: s:color3,
\  4: s:color4,
\  5: s:color5,
\  6: s:color6,
\  7: s:color7,
\  8: s:color8,
\  9: s:color9,
\  10: s:color10,
\  11: s:color11,
\  12: s:color12,
\  13: s:color13,
\  14: s:color14,
\  15: s:color15,
\  }

function! <SID>MSXColor(elt, fg, bg)
  let fgc = "guifg=" .. g:msxcolors[a:fg]
  let bgc = "guibg=" .. g:msxcolors[a:bg]
  let cmd = "hi! " .. a:elt .. " gui=NONE " .. fgc .. " " .. bgc
  silent execute cmd
endfunction

function! <SID>MSXBackground(elt, bg)
  let bgc = "guibg=" .. g:msxcolors[a:bg]
  let cmd = "hi! " .. a:elt .. " gui=NONE " .. bgc
  silent execute cmd
endfunction

function! <SID>MSXForeground(elt, fg)
  let fgc = "guifg=" .. g:msxcolors[a:fg]
  let cmd = "hi! " .. a:elt .. " gui=NONE " .. fgc
  silent execute cmd
endfunction

function! <SID>linkNoAttributes(from_g, to_g)
  let cmd = "hi! " .. a:to_g .. " gui=NONE"
  silent execute cmd
  let cmd = "hi! link " .. a:to_g .. " " .. a:from_g
  silent execute cmd
endfunction

com! -nargs=* COLOR call <SID>MSXColor(<f-args>)
com! -nargs=* BG call <SID>MSXBackground(<f-args>)
com! -nargs=* FG call <SID>MSXForeground(<f-args>)
com! -nargs=* LINK call <SID>linkNoAttributes(<f-args>)

FG Boolean 7
LINK Boolean Character
LINK Boolean letant
LINK Boolean Float
LINK Boolean Number
LINK Boolean String
BG ColorColumn 5
FG Comment 10
FG Conditional 3
LINK Conditional Decorator
LINK Conditional Function
LINK Conditional Identifier
LINK Conditional Repeat
LINK Conditional Statement
LINK Conditional Structure
LINK Conditional Type
LINK Conditional Typedef
BG Cursor 14
BG lCursor 14
BG CursorColumn 5
LINK CursorColumn CursorLine
FG debugBreakpoint 9
BG debugPC 5
FG Define 11
hi! Define gui=bold
LINK Define Include
LINK Define PreProc
LINK Define StorageClass
FG Delimiter 10
LINK Delimiter Operator
LINK Delimiter Tag
BG DiffAdd 12
BG DiffChange 4
BG DiffDelete 6
BG DiffText 5
FG Directory 11
COLOR Error 11 8
LINK Error ErrorMsg
LINK Error Todo
FG Exception 9
LINK Exception Label
COLOR Folded 10 5
COLOR IncSearch 2 15
LINK IncSearch Search
FG LineNr 14
FG Keyword 11
LINK LineNr FoldColumn
LINK LineNr SignColumn
COLOR MatchParen 11 4
FG NonText 14
LINK NonText EndOfBuffer
LINK NonText ModeMsg
LINK NonText MoreMsg
LINK NonText Question
LINK NonText StatusLine
LINK NonText StatusLineNC
LINK NonText StatusLineTerm
LINK NonText StatusLineTermNC
LINK NonText TabLine
LINK NonText TabLineFill
COLOR Normal 15 4
LINK Normal CursorLineNr
LINK Normal Terminal
COLOR Pmenu 15 5
BG PMenuSbar 5
COLOR PmenuSel 11 12
BG PmenuThumb 13
FG Special 2
LINK Special SpecialChar
FG SpecialKey 14
FG SpellBad 9
FG SpellCap 10
LINK SpellCap SpellLocal
LINK SpellCap SpellRare
COLOR TabLineSel 11 4
COLOR Title 1 4
BG VertSplit 10
FG Underlined 3
COLOR Visual 1 14
LINK Visual VisualNOS
COLOR WarningMsg 15 8
COLOR WildMenu 15 4

" Palette on blue background
function! <SID>OnBlue(name, fg)
  let fgc = " guifg=" .. g:msxcolors[a:fg]
  let cmd = "hi! " .. a:name .. " guibg=" .. s:color4 .. fgc
  silent execute cmd
endfunction

com! -nargs=* ONBLUE call <SID>OnBlue(<f-args>)

ONBLUE MsxBlack 1
ONBLUE MsxMGreen 2
ONBLUE MsxLGreen 3
 " Dark blue on dark blue => invisible
ONBLUE MsxDBlue 4
ONBLUE MsxLBlue 5
ONBLUE MsxDRed 6
ONBLUE MsxCyan 7
ONBLUE MsxMRed 8
ONBLUE MsxLRed 9
ONBLUE MsxDYellow 10
ONBLUE MsxLYellow 11
ONBLUE MsxDGReen 12
ONBLUE MsxMagenta 13
ONBLUE MsxGray 14
ONBLUE MsxWhite 15

let g:terminal_ansi_colors = [
      \ s:color1,
      \ s:color8,
      \ s:color2,
      \ s:color6,
      \ s:color5,
      \ s:color13,
      \ s:color7,
      \ s:color14,
      \ s:color14,
      \ s:color9,
      \ s:color3,
      \ s:color10,
      \ s:color5,
      \ s:color13,
      \ s:color7,
      \ s:color15
      \ ]


" Coc.nvim
FG CocSearch 11

if exists(":RainbowToggleOff")
  RainbowToggleOff
  let g:rainbow_conf = exists("g:rainbow_conf") ? g:rainbow_conf : {}
  let g:rainbow_conf["guifgs"] =
        \ [
        \ s:color11,
        \ s:color1,
        \ s:color3,
        \ s:color9,
        \ s:color13,
        \ s:color15
        \ ]
  RainbowToggleOn
endif
