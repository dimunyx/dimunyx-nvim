-- NOTE: Neovim config

-- Lazy (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable",
                lazypath,
        })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true

-- Plugins
require("lazy").setup({
        -- Colorscheme
        {
                "RRethy/base16-nvim"
        },

	-- Discord status plugin
	{
		"IogaMaster/neocord",
		event = "VeryLazy"
	},

        -- Treesitter
        {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
                opts = {
                        ensure_installed = {
                                "lua",
                                "vim",
                                "vimdoc",
                                "javascript",
                                "typescript",
                                "clangd",
                                "bash",
                                "c",
                                "cpp",
                                "nix",
                                "python",
                                "commonlisp",
                                "rust",
                                "go",
                                "gomod",
                                "gowork",
                                "markdown_inline"
                        },
                        auto_install = true,
                }
        },

        -- Mason
        {
                "williamboman/mason.nvim",
                opts = {}
        },

        -- Telescope
        {
                "nvim-telescope/telescope.nvim",
                dependencies = {
                        "nvim-lua/plenary.nvim"
                }
        },

        -- Colorizer
        {
                "catgoose/nvim-colorizer.lua",
                event = "BufReadPre",
                opts = {},
        },

        -- Lualine
        {
                "nvim-lualine/lualine.nvim",
                dependencies = {
                        "nvim-tree/nvim-web-devicons"
                }
        },

        -- Barbar (tabs)
        {
                "romgrk/barbar.nvim",
                dependencies = {
                        "lewis6991/gitsigns.nvim",
                        "nvim-tree/nvim-web-devicons"
                },
                init = function()
                        vim.g.barbar_auto_setup = false
                end,
                opts = {},
                version = "^1.0.0"
        },

        -- Illuminate
        {
                "RRethy/vim-illuminate",
                config = function()
                        vim.g.Illuminate_delay = 100
                        vim.g.Illuminate_under_cursor = 1
                        vim.g.Illuminate_min_count_to_highligh = 2
                end
        },

        -- Mini.pairs
        {
                "nvim-mini/mini.pairs",
                version = false,
                opts = {
                        modes = {
                                insert = true,
                                command = false,
                                terminal = false
                        },
                        mappings = {
                                ['('] = {
                                        action = "open",
                                        pair = "()",
                                        neigh_pattern = "^[^\\]"
                                },
                                ['['] = {
                                        action = "open",
                                        pair = "[]",
                                        neigh_pattern = "^[^\\]"
                                },
                                ['{'] = {
                                        action = "open",
                                        pair = "{}",
                                        neigh_pattern = "^[^\\]"
                                },
                                [')'] = {
                                        action = "close",
                                        pair = "()",
                                        neigh_pattern = "^[^\\]"
                                },
                                [']'] = {
                                        action = "close",
                                        pair = "[]",
                                        neigh_pattern = "^[^\\]"
                                },
                                ['}'] = {
                                        action = "close",
                                        pair = "{}",
                                        neigh_pattern = "^[^\\]"
                                },
                                ['"'] = {
                                        action = "closeopen",
                                        pair = '""',
                                        neigh_pattern = "^[^\\]",
                                        register = {
                                                cr = false
                                        }
                                },
                                ["'"] = {
                                        action = "closeopen",
                                        pair = "''",
                                        neigh_pattern = "^[^%a\\]",
                                        register = {
                                                cr = false
                                        }
                                },
                                ['`'] = {
                                        action = "closeopen",
                                        pair = "``",
                                        neigh_pattern = "^[^\\]",
                                        register = {
                                                cr = false
                                        }
                                }
                        }
                }
        },

        -- Neo-tree
        {
                "nvim-neo-tree/neo-tree.nvim",
                branch = "v3.x",
                dependencies = {
                        "nvim-lua/plenary.nvim",
                        "MunifTanjim/nui.nvim",
                        "nvim-tree/nvim-web-devicons"
                },
                lazy = false
        },

        -- LSP config
        {
                "neovim/nvim-lspconfig"
        },

        -- Autocompletion
        {
                "hrsh7th/nvim-cmp",
                dependencies = {
                        "hrsh7th/cmp-nvim-lsp",
                        "hrsh7th/cmp-buffer",
                        "hrsh7th/cmp-path",
                },
                config = function()
                        local cmp = require('cmp')
                        cmp.setup({
                                window = {
                                        completion = {
                                                border = "rounded",
                                                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                                                max_view = 5,
                                        },
                                        documentation = {
                                                border = "rounded",
                                                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                                        },
                                },
                                mapping = cmp.mapping.preset.insert({
                                        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                                        ['<C-Space>'] = cmp.mapping.complete(),
                                        ['<C-e>'] = cmp.mapping.abort(),
                                        ['<CR>'] = cmp.mapping.confirm({ select = true }),
                                }),
                                sources = cmp.config.sources({
                                        { name = 'nvim_lsp' },
                                        { name = 'buffer' },
                                        { name = 'path' },
                                })
                        })
                end
        }
})

-- Plugin settings
require("matugen").setup()

-- Neocord
require("neocord").setup({
	logo = "auto",
	logo_tooltip = "nil",
	main_image = "language",
	show_time = true
})

-- Telescope
require("telescope").setup({
        defaults = {
                border = true,
                selection_caret = "-> ",
                borderchars = {
                        "─",
                        "│",
                        "─",
                        "│",
                        "┌",
                        "┐",
                        "┘",
                        "└"
                }
        }
})

-- Lualine
require("lualine").setup({
        options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = {
                        left = "",
                        right = ""
                },
                section_separators = {
                        left = "",
                        right = ""
                },
                disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                },
                refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                        refresh_time = 16,
                }
        }
})

-- Barbar
require("barbar").setup({
        animation = true,
        auto_hide = false,
        clickable = true,
        tabpages = true,
        focus_on_close = "left",
        icons = {
                button = "󰖭",
                buffer_mode = {
                        enabled = false
                },
                buffer_number = {
                        enabled = false
                },
                filetype = {
                        enabled = true
                },
                separator = {
                        left = "",
                        right = ""
                },
                inactive = {
                        button = "󰖭"
                }
        }
})

-- Neo-tree
require("neo-tree").setup({
        enable_git_status = true,
        position = "left",
        filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false
        }
})

-- Highlight groups
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#8CAAEE" })
vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#8CAAEE" })

-- LSP configuration
vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
})

-- LSP keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end, opts)

-- LSP servers
vim.lsp.config('clangd', {
        cmd = { 'clangd' },
        filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
        root_markers = { '.clangd', 'compile_commands.json', '.git' },
})

vim.lsp.config('pyright', {
        cmd = { 'pyright' },
        filetypes = { 'python' },
        root_markers = { 'pyproject.toml', 'setup.py', '.git' },
})

vim.lsp.config('bashls', {
        cmd = { 'bash-language-server', 'start' },
        filetypes = { 'sh', 'bash' },
        root_markers = { '.git' },
})

vim.lsp.config('html', {
        cmd = { 'html-languageserver', '--stdio' },
        filetypes = { 'html', 'htmldjango' },
        root_markers = { '.git' },
})

vim.lsp.config('cssls', {
        cmd = { 'css-languageserver', '--stdio' },
        filetypes = { 'css', 'scss', 'less' },
        root_markers = { '.git' },
})

vim.lsp.config('nil_ls', {
        cmd = { 'nil' },
        filetypes = { 'nix' },
        root_markers = { 'flake.nix', '.git' },
})

vim.lsp.config('qmlls', {
        cmd = { 'qmlls' },
        filetypes = { 'qml', 'qmljs' },
        root_markers = { '.git' },
})

-- Harper-ls (grammar & spelling)
vim.lsp.config('harper-ls', {
        cmd = { 'harper-ls' },
        filetypes = { 'markdown', 'text', 'nix', 'cpp' },
        root_markers = { '.git' },
})

vim.lsp.enable({
        'clangd',
        'pyright',
        'bashls',
        'html',
        'cssls',
        'nil_ls',
        'qmlls',
        'harper_ls',
})

-- Vim settings
vim.opt.number = true
vim.opt.wrap = false
vim.opt.shortmess:append "I"
vim.opt.showmode = false

-- Keymaps
vim.keymap.set("n", "<M-w>", "<Cmd>write<CR>")
vim.keymap.set("n", "<M-q>", "<Cmd>quit<CR>")
vim.keymap.set("n", "<M-x>", "<Cmd>xit<CR>")
vim.keymap.set("n", "<M-S-w>", "<Cmd>write!<CR>")
vim.keymap.set("n", "<M-S-q>", "<Cmd>quit!<CR>")
vim.keymap.set("n", "<M-S-x>", "<Cmd>xit!<CR>")

vim.keymap.set("n", "<M-t>", "<Cmd>tabnew<CR>")

vim.keymap.set("n", "<M-e>", ":edit ")

vim.keymap.set("n", "<M-n>", "<Cmd>Neotree show<CR>")
vim.keymap.set("n", "<M-S-n>", "<Cmd>Neotree close<CR>")

vim.keymap.set("n", "<M-Left>", "<C-w><Left>")
vim.keymap.set("n", "<M-Right>", "<C-w><Right>")
vim.keymap.set("n", "<M-Up>", "<C-w><Up>")
vim.keymap.set("n", "<M-Down>", "<C-w><Down>")

vim.keymap.set("n", "<A-CR>", "<Cmd>vsplit<CR>")
vim.keymap.set("n", "<A-S-CR>", "<Cmd>split<CR>")

vim.keymap.set("n", "<M-s>", function()
        require("telescope.builtin").find_files({
                cwd = vim.fn.expand("/home/dimunyx"),
                hidden = true,
                file_ignore_patterns = {
                        "Изображения",
                        "Видео",
                        "Загрузки",
                        "Проекты",
                        "Шаблоны",
                        "Общедоступные",
                        "Музыка",
                        ".cache",
                        ".nix-defexpr",
                        ".var"
                },
        })
end)

vim.keymap.set("n", "<M-i>", "<Cmd>edit ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<A-f>", "/", { silent = false })
vim.keymap.set("n", "<A-c>", ":%s/", { silent = false })
vim.keymap.set("n", "<A-l>", ":", { silent = false })