local util = require('junkbox.util')

util.lnmap('<space>', [[:bnext<cr>]])
util.lnmap('<bs>',    [[:bprevious<cr>]])

util.lnmap('j',  [[%! jq .<cr>]])
util.lvmap('64', [[c<c-r>=system('base64 --decode', @")<cr><esc>]])

-- +top
util.lnmap('%',  [[:lua require'junkbox.util'.source()<cr>]])
util.lnmap('k',  [[:close<cr>]])
util.lnmap('q',  [[:Sayonara<cr>]], {silent = true})
util.lnmap('c',  [[:lcd %:p:h<cr>:pwd<cr>]])
util.lnmap('-',  [[:vsplit $PWD<cr>]])
util.lnmap('T',  [[:vsplit | term<cr>]])

-- +toggles
util.lnmap('tw', [[:set wrap!<cr>]])
util.lnmap('tg', [[:GoldenRatioToggle<cr>]])

-- +files
util.lnmap('ff', [[:Telescope find_files<cr>]])

-- +buffers
util.lnmap('bf', [[:Telescope buffers<cr>]])
util.lnmap('bl', [[:ls<cr>:b<space>]])
util.lnmap('bs', [[:ls<cr>:sb<space>]])
util.lnmap('bv', [[:ls<cr>:vertical sb<space>]])
util.lnmap('ba', [[:vertical ball<cr>]])
util.lnmap('bD', [[:%bdelete!<cr>]])
util.lnmap('bW', [[:%bwipeout!<cr>]])

-- +windows
util.lnmap('ww', [[<Plug>(golden_ratio_resize)]])
util.lnmap('wf', [[<C-w><Bar><C-w>_]])
util.lnmap('w=', [[<C-w>=]])
util.lnmap('wo', [[:only<cr>]])
util.lnmap('wr', [[<C-w>r]])

-- +git
util.lnmap('gp', [[:Git push<cr>]])
util.lnmap('gg', [[:vertical Git<cr>]])
util.lnmap('gd', [[:Gvdiffsplit<cr>]])
