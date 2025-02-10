-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_ruby_lsp = "ruby_lsp"
-- vim.g.lazyvim_ruby_formatter = "rubocop"
vim.opt.termguicolors = true

function Go_to_test()
  local current_file = vim.fn.expand("%:p")
  local target_file

  if current_file:match("/spec/") then
    -- Navigate from spec file to source file
    target_file = current_file:gsub("/spec/", "/app/"):gsub("_spec.rb", ".rb")
  else
    -- Navigate from source file to spec file
    target_file = current_file:gsub("/app/", "/spec/"):gsub(".rb", "_spec.rb")
  end

  -- Check if the file exists
  if vim.fn.filereadable(target_file) == 0 then
    vim.notify(("Can't find file: %s"):format(target_file))
  end

  -- Open the spec file
  vim.cmd("edit " .. target_file)
end

function Copy_file_path()
  local current_file = vim.fn.expand("%:p")
  local current_file_name = vim.fn.expand("%:t")
  local modify = vim.fn.fnamemodify

  local vals = {
    ["BASENAME"] = modify(current_file_name, ":r"),
    ["EXTENSION"] = modify(current_file_name, ":e"),
    ["FILENAME"] = current_file_name,
    ["PATH (CWD)"] = modify(current_file, ":."),
    ["PATH (HOME)"] = modify(current_file, ":~"),
    ["PATH"] = current_file,
    ["URI"] = vim.uri_from_fname(current_file),
  }

  local options = vim.tbl_filter(function(val)
    return vals[val] ~= ""
  end, vim.tbl_keys(vals))

  if vim.tbl_isempty(options) then
    vim.notify("No values to copy", vim.log.levels.WARN)
    return
  end

  table.sort(options)

  vim.ui.select(options, {
    prompt = "Choose to copy to clipboard:",
    format_item = function(item)
      return ("%s: %s"):format(item, vals[item])
    end,
  }, function(choice)
    local result = vals[choice]
    if result then
      vim.notify(("Copied: `%s`"):format(result))
      vim.fn.setreg("+", result)
    end
  end)
end
