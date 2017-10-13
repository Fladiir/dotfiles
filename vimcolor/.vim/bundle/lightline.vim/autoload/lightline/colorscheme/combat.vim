" =============================================================================
" Filename: autoload/lightline/colorscheme/wombat.vim
" Author: itchyny
" License: MIT License
" Last Change: 2015/11/30 08:37:43.
" =============================================================================
let s:base03 = [ '#242424', 235 ]
let s:base023 = [ '#353535 ', 236 ]
let s:base02 = [ '#444444 ', 238 ]
let s:base01 = [ '#585858', 240 ]
let s:base00 = [ '#666666', 242  ]
let s:base0 = [ '#808080', 244 ]
let s:base1 = [ '#969696', 247 ]
let s:base2 = [ '#a8a8a8', 248 ]
let s:base3 = [ '#d0d0d0', 252 ]
let s:yellow = [ '#cae682', 180 ]
let s:orange = [ '#e5786d', 173 ]
let s:red = [ '#bb4455', 9 ]
let s:magenta = [ '#772244', 5 ]
let s:blue = [ '#44559f ', 4 ]
let s:black = [ '#000000', 0 ]
let s:brblack = [ '#313737', 8 ]
let s:white = ['#eeffdd', 15 ]
let s:green = [ '#aacc55', 2 ]
let s:cyan = ['#338888', 6 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
"Normal mode colors
let s:p.normal.left = [ [ s:white , s:brblack ], [ s:white, s:base01 ] ]
let s:p.normal.right = [ [ s:white, s:brblack ], [ s:white, s:base01 ] ]
let s:p.normal.middle = [ [ s:white, s:base02 ] ]
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

"Inactive mode colors
let s:p.inactive.right = [ [ s:base023, s:base01 ], [ s:base00, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base02 ], [ s:base00, s:base023 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base023 ] ]

"Insert mode colors
let s:p.insert.left = [ [ s:white, s:magenta ], [ s:base3,s:red ] ]
let s:p.insert.right = [ [ s:white, s:magenta ], [ s:base3,s:red ] ]
let s:p.insert.middle = [ [ s:base3,s:magenta ] ]

"Replace mode colors
let s:p.replace.left = [ [ s:black, s:red ], [ s:black, s:magenta ] ]
let s:p.replace.middle = [ [ s:black, s:red ] ]
let s:p.replace.right = [ [ s:black, s:red ], [ s:black, s:magenta ] ]

"Visual mode colors
let s:p.visual.left = [ [ s:white, s:blue ], [ s:white, s:cyan ] ]
let s:p.visual.middle = [ [ s:white, s:blue ], [ s:white, s:cyan ] ]
let s:p.visual.right = [ [ s:white, s:blue ], [ s:white, s:cyan ] ]

"General colors
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base03 ] ]
let s:p.tabline.middle = [ [ s:base2, s:base02 ] ]
let s:p.tabline.right = [ [ s:base2, s:base00 ] ]

let g:lightline#colorscheme#combat#palette = lightline#colorscheme#flatten(s:p)
