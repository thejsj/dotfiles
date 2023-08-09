local set = vim.opt


set.compatible = false --  disable compatibility to old-time vi
set.guicursor = ''
set.re = 0 -- https://jameschambers.co.uk/vim-typescript-slow
-- filetype plugin indent on
-- scriptencoding utf-8


-- Saving Files

set.backup = false
set.writebackup = false
set.swapfile = true
set.dir = "~/.vim/tmp"
set.autoread = true    -- Automatically refresh any unchanged files
set.autowrite = true   -- Automatically write file when leaving buffer
set.hidden = true      -- Allow buffer switching without saving
set.autochdir = false -- Set working directory to the current file
set.browsedir = "current"

-- Code Display
-- syntax enable             " Syntax highligthing
-- https://www.reddit.com/r/neovim/comments/cfdxo9/do_i_need_set_t_co256/
-- set.t_Co = 256
set.background = "dark"
set.foldenable = false -- Show the ruler
set.ruler = true
set.rulerformat = "%30(%=:b%n%y%m%r%w %l,%c%V %P%)" -- A ruler on steroids
set.showcmd = true -- Show partial commands in the status line


set.tabpagemax = 15       -- Only show tabs
set.showmode = true       -- Display the current mode
set.number = true         -- Line numbers on
set.relativenumber = true -- Relative numbers
set.showmatch = true      -- Show matching brackets/parenthesis

set.spell = true          -- Spell checking on
set.spelllang = 'en_us'

-- Show spaces and tabs as characters
set.list = true
set.listchars = [[tab:> ,extends:#,precedes:<,nbsp:.,trail:•]] --  Highlight problematic whitespace

-- Indentation settings
set.shiftwidth = 2     -- Indents of 2 spaces
set.tabstop = 2        -- An indentation every 2 columns
set.joinspaces = false -- Prevents inserting two spaces after punctuation on a join (J)
set.softtabstop = 2
set.expandtab = true
set.autoindent = true

set.colorcolumn = "80"                       -- Why is this a string?
set.guifont= "Source Code Pro for Powerline" -- make sure to escape the spaces in the name properly

-- Mouse
set.mouse= "a"       -- Automatically enable mouse usage
set.mousehide = true -- Hide the mouse cursor while typing


--  Cursor

set.virtualedit="onemore"      -- Allow for cursor beyond last characther
set.cursorline = true          -- Highlight current line
set.backspace= [[indent,eol,start]] -- Backspace for dummies


-- Search

set.incsearch = true  -- Find as you type search
set.hlsearch = true   -- Highlight search terms
set.ignorecase = true -- Case insensitive search


-- Command menu

set.wildmenu = true                       -- Show list instead of just completing
set.wildmode= "longest,list:longest,full" -- Command <Tab> completion

--  Statusline
set.laststatus = 2


-- Other

set.shortmess:append("filmnrxoOtT")                           -- Abbrev of messages (avoids 'hit enter')
set.viewoptions = {"folds","options","cursor","unix","slash"} -- Better Unix / Window compatiblity
set.history=1000                                              -- Store history (Default is 20)

