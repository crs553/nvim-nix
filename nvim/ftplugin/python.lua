if vim.fn.executable('pylsp') ~= 1 then
  vim.notify('Pylsp not found', vim.log.levels.WARN)
  return
end

local root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  '.git',
}

local root = vim.fs.find(root_files, { upward = true })[1]
local root_dir = root and vim.fs.dirname(root) or vim.loop.cwd()

vim.lsp.start {
  name = 'pylsp',
  cmd = { 'pylsp' },
  root_dir = root_dir,
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    pylsp = {
      plugins = {
        black = { enabled = true, line_length = 88 },
        mypy = { enabled = true, live_mode = true },
        pyflakes = { enabled = false }, -- optional, disable redundant linter
        pycodestyle = { enabled = false }, -- optional, let black handle style
      },
    },
  },
  on_attach = function(client, bufnr)
    vim.notify('Pylsp attached to buffer ' .. bufnr)
  end,
}
