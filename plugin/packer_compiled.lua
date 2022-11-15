-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/ethanpollack/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/ethanpollack/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/ethanpollack/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/ethanpollack/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/ethanpollack/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/ethanpollack/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    config = { "\27LJ\2\nu\0\0\3\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0016\0\4\0'\2\3\0B\0\2\0029\0\5\0005\2\6\0B\0\2\1K\0\1\0\1\0\1\fflavour\nmocha\nsetup\frequire\15catppuccin\16colorscheme\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/ethanpollack/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/ethanpollack/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/ethanpollack/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["lualine.nvim"] = {
    config = {},
    loaded = true,
    path = "/Users/ethanpollack/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireÔ\a\1\0\n\0005\0“\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0039\4\b\0009\4\t\0049\4\n\0045\6\f\0009\a\b\0009\a\v\a)\tüÿB\a\2\2=\a\r\0069\a\b\0009\a\v\a)\t\4\0B\a\2\2=\a\14\0069\a\b\0009\a\15\aB\a\1\2=\a\16\0069\a\b\0009\a\17\aB\a\1\2=\a\18\0069\a\b\0009\a\19\a5\t\20\0B\a\2\2=\a\21\6B\4\2\2=\4\b\0034\4\3\0005\5\22\0>\5\1\0045\5\23\0>\5\2\4=\4\24\3B\1\2\0016\1\0\0'\3\25\0B\1\2\0029\1\26\1B\1\1\0026\2\0\0'\4\27\0B\2\2\0029\2\28\0029\2\2\0025\4\29\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2\31\0029\2\2\0025\4 \0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2!\0029\2\2\0025\4\"\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2#\0029\2\2\0025\4$\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2%\0029\2\2\0025\4&\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2'\0029\2\2\0025\4(\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2)\0029\2\2\0025\4*\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2+\0029\2\2\0025\4,\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2-\0029\2\2\0025\4.\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2/\0029\2\2\0025\0040\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\0021\0029\2\2\0025\0042\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\0023\0029\2\2\0025\0044\0=\1\30\4B\2\2\1K\0\1\0\1\0\0\rtsserver\1\0\0\nsqlls\1\0\0\vjsonls\1\0\0\25java_language_server\1\0\0\thtml\1\0\0\vglslls\1\0\0\18cssmodules_ls\1\0\0\ncssls\1\0\0\14csharp_ls\1\0\0\ncmake\1\0\0\fpyright\17capabilities\1\0\0\vclangd\14lspconfig\25default_capabilities\17cmp_nvim_lsp\fsources\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/ethanpollack/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/ethanpollack/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/ethanpollack/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/ethanpollack/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/ethanpollack/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/ethanpollack/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
time([[Config for lualine.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireÔ\a\1\0\n\0005\0“\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0039\4\b\0009\4\t\0049\4\n\0045\6\f\0009\a\b\0009\a\v\a)\tüÿB\a\2\2=\a\r\0069\a\b\0009\a\v\a)\t\4\0B\a\2\2=\a\14\0069\a\b\0009\a\15\aB\a\1\2=\a\16\0069\a\b\0009\a\17\aB\a\1\2=\a\18\0069\a\b\0009\a\19\a5\t\20\0B\a\2\2=\a\21\6B\4\2\2=\4\b\0034\4\3\0005\5\22\0>\5\1\0045\5\23\0>\5\2\4=\4\24\3B\1\2\0016\1\0\0'\3\25\0B\1\2\0029\1\26\1B\1\1\0026\2\0\0'\4\27\0B\2\2\0029\2\28\0029\2\2\0025\4\29\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2\31\0029\2\2\0025\4 \0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2!\0029\2\2\0025\4\"\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2#\0029\2\2\0025\4$\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2%\0029\2\2\0025\4&\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2'\0029\2\2\0025\4(\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2)\0029\2\2\0025\4*\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2+\0029\2\2\0025\4,\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2-\0029\2\2\0025\4.\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\2/\0029\2\2\0025\0040\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\0021\0029\2\2\0025\0042\0=\1\30\4B\2\2\0016\2\0\0'\4\27\0B\2\2\0029\0023\0029\2\2\0025\0044\0=\1\30\4B\2\2\1K\0\1\0\1\0\0\rtsserver\1\0\0\nsqlls\1\0\0\vjsonls\1\0\0\25java_language_server\1\0\0\thtml\1\0\0\vglslls\1\0\0\18cssmodules_ls\1\0\0\ncssls\1\0\0\14csharp_ls\1\0\0\ncmake\1\0\0\fpyright\17capabilities\1\0\0\vclangd\14lspconfig\25default_capabilities\17cmp_nvim_lsp\fsources\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\nu\0\0\3\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0016\0\4\0'\2\3\0B\0\2\0029\0\5\0005\2\6\0B\0\2\1K\0\1\0\1\0\1\fflavour\nmocha\nsetup\frequire\15catppuccin\16colorscheme\bcmd\bvim\0", "config", "catppuccin")
time([[Config for catppuccin]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
