-- Custom Commands

local mode = 0;

function Toggle_WriteMode()
  -- Zen
  vim.cmd('ZenMode')

  -- Colorscheme and Pencil
  if mode == 0 then
    vim.cmd('set nonumber')
    vim.cmd('colorscheme flexoki-light')
    vim.cmd('PencilSoft')
    mode = 1
  else
    mode = 0
    vim.cmd('set number')
    vim.cmd('colorscheme moonfly')
    vim.cmd('PencilOff')
  end

  -- Spell Check
  vim.cmd('set invspell')

  -- CursorLine
  vim.cmd('set invcursorline')


end

-- Map a key to trigger the Toggle_WriteMode function
vim.api.nvim_set_keymap('n', '<Leader>w', ':lua Toggle_WriteMode()<CR>', { noremap = true, silent = true, desc = "Toggle Write Mode" })
