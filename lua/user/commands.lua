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

-- Define a custom command to run MATLAB scripts
vim.api.nvim_create_user_command(
    'RunMatlab',
    function()
        local file = vim.fn.expand('%:p')
        vim.cmd('w') -- Save the current file
        vim.fn.jobstart('matlab -nodesktop -nosplash -r "run(\'' .. file .. '\');"', {
            stdout_buffered = true,
            on_stdout = function(_, data)
                if data then
                    print(table.concat(data, '\n'))
                end
            end,
            on_stderr = function(_, data)
                if data then
                    vim.api.nvim_err_writeln(table.concat(data, '\n'))
                end
            end,
        })
    end,
    {}
)
