Mapper = {}

local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function Mapper:nmap(shortcut, command)
  map('n', shortcut, command)
end

function Mapper:vmap(shortcut, command)
  map('v', shortcut, command)
end

function Mapper:imap(shortcut, command)
  map('i', shortcut, command)
end

function Mapper:tmap(shortcut, command)
  map('t', shortcut, command)
end
