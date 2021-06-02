local function on_attach(_, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	local opts = { noremap=true, silent=true }
	buf_set_keymap('n', '<space>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', '<space>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
end

local function switch_source_header_splitcmd(bufnr, splitcmd)
    bufnr = require'lspconfig'.util.validate_bufnr(bufnr)
    local params = { uri = vim.uri_from_bufnr(bufnr) }
    vim.lsp.buf_request(bufnr, 'textDocument/switchSourceHeader', params, function(err, _, result)
        if err then error(tostring(err)) end
        if not result then print ("Corresponding file can’t be determined") return end
        vim.api.nvim_command(splitcmd..' '..vim.uri_to_fname(result))
    end)
end

require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end,
	commands = {
    	ClangdSwitchSourceHeader = {
    		function() switch_source_header_splitcmd(0, "edit") end;
    		description = "Open source/header in current buffer";
    	},
    	ClangdSwitchSourceHeaderVSplit = {
    		function() switch_source_header_splitcmd(0, "vsplit") end;
    		description = "Open source/header in a new vsplit";
    	},
    	ClangdSwitchSourceHeaderSplit = {
    		function() switch_source_header_splitcmd(0, "split") end;
    		description = "Open source/header in a new split";
    	}
    }
}

require'lspconfig'.sumneko_lua.setup {
	on_attach=on_attach,
	rootPatterns = {".git"},
	cmd = {
		"/home/brbl/Softwares/lua-language-server/bin/Linux/lua-language-server",
		"-E",
		"/home/brbl/Softwares/lua-language-server/main.lua",
	},
	filetypes = { "lua", "lua2p" },
	settings = {
		Lua = {
			develop = {
				enable = true,
			},
			telemetry = {
				enable = false,
			},
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
				plugin = "/home/brbl/.config/nvim/lua/plugin.lua",
			},
			diagnostics = {
				enable = true,
				globals = {"love", "vim", "if", "end", "then", "!"},
				disable = {"lowercase-global"},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
				ignoreDir = {".vscode", ".git"}
			},
			completion = {
				keywordSnippet = "Disable"
			}
		},
		files = {
			associations = {
				["*.lua2p"] = "lua",
			}
		}
	},
}

local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = false,
    -- whether to show outline guides
    -- default: true
    show_guides = true,
}

require('symbols-outline').setup(opts)

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 0;
  preselect = 'disable';
  throttle_time = 20;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    nvim_lsp = true;
    buffer = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
