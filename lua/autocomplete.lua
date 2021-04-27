vim.cmd [[packadd nvim-lspconfig]]
vim.cmd [[packadd nvim-compe]]

require "compe".setup {
	enabled = true,
	autocomplete = true,
	debug = false,
	min_length = 1,
	preselect = "enable",
	throttle_time = 80,
	source_timeout = 200,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,
	documentation = true,
	source = {
		path = true,
		buffer = true,
		calc = true,
		--        vsnip = true,
		nvim_lsp = true,
		nvim_lua = true,
		spell = true,
		tags = true,
		snippets_nvim = true,
		--        treesitter = true
	}
}

vim.cmd[[inoremap <silent><expr> <C-Space> compe#complete()]]
vim.cmd[[inoremap <silent><expr> <CR>      compe#confirm('<CR>')]]
vim.cmd[[inoremap <silent><expr> <C-e>     compe#close('<C-e>')]]

-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.cmd[[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]]
vim.cmd[[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]]

-- have a fixed column for the diagnostics to appear in this removes the jitter when warnings/errors flow in
vim.cmd[[set signcolumn=yes]]

vim.cmd[[set updatetime=300]]
-- Show diagnostic popup on cursor hover
vim.cmd[[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]

-- Goto previous/next diagnostic warning/error
vim.cmd[[nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]]
vim.cmd[[nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>]]

