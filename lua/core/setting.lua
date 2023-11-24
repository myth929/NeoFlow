-- Author: myth929
-- Description: neovim 配置

-- :help options
vim.g.mapleader = ";"

vim.opt.shortmess:append "c"
vim.opt.list = true
vim.opt.listchars:append "space:⋅"

-- nvim-tree need disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local settings = {
    backup = false,                                -- creates a backup file
    -- clipboard = 'unnamedplus', -- 使用系统剪切板，需要安装 xsel 依赖
    cmdheight = 1,                                 -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" },       -- mostly just for cmp
    conceallevel = 0,                              -- so that `` is visible in markdown files
    fileencoding = "utf-8",                        -- the encoding written to a file
    hlsearch = true,                               -- highlight all matches on previous search pattern
    ignorecase = true,                             -- ignore case in search patterns
    mouse = "a",                                   -- allow the mouse to be used in neovim
    pumheight = 10,                                -- pop up menu height
    showmode = false,                              -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,                               -- always show tabs
    smartcase = true,                              -- smart case
    smartindent = true,                            -- make indenting smarter again
    splitbelow = true,                             -- force all horizontal splits to go below current window
    splitright = true,                             -- force all vertical splits to go to the right of current window
    swapfile = false,                              -- creates a swapfile
    termguicolors = true,                          -- set term gui colors (most terminals support this)
    timeoutlen = 1000,                             -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                               -- enable persistent undo
    undodir = vim.fn.stdpath('config') .. '/undo', -- store all undo history in the undo dir
    updatetime = 300,                              -- faster completion (4000ms default)
    writebackup = false,                           -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                              -- 设置缩进用空格来表示
    shiftwidth = 4,                                -- 表示每一级缩进的长度
    tabstop = 4,                                   -- insert 4 spaces for a tab
    cursorline = true,                             -- highlight the current line
    number = true,                                 -- set numbered lines
    relativenumber = false,                        -- set relative numbered lines
    numberwidth = 4,                               -- set number column width to 2 {default 4}
    signcolumn = "yes",                            -- always show the sign column, otherwise it would shift the text each time
    wrap = true,                                   -- display lines as one long line
    scrolloff = 8,                                 -- is one of my fav
    sidescrolloff = 8,
    -- guifont = "monospace:h17" -- the font used in graphical neovim applications

    list = true,
}

for key, value in pairs(settings) do
    vim.opt[key] = value
end

return settings
