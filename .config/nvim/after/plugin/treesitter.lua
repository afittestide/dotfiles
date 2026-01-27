local ok, ts = pcall(require, "nvim-treesitter")
if not ok then return end

-- Enable highlighting and indentation
vim.treesitter.language.register("bash", "sh")

-- Treesitter highlighting is enabled by default in Neovim 0.10+
-- Just ensure auto_install is set up
ts.setup({
    auto_install = true,
})
