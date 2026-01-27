local map = vim.keymap.set

-- Telescope
local ok, builtin = pcall(require, "telescope.builtin")
if ok then
    map("n", "<C-p>", builtin.git_files, { desc = "Find git files" })
    map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
end

-- Fugitive
map("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
