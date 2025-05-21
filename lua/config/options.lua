-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_ruby_lsp = "ruby_lsp"
-- vim.g.lazyvim_ruby_formatter = "rubocop"
vim.opt.termguicolors = true

function Find_code_owners()
  local full_filename = vim.fn.expand("%:p") -- Get absolute path of the current file

  local relative_filename = full_filename:match(".*/core/(.*)")
  local package_name = full_filename:match("packages/([^/]+)/")

  if not relative_filename then
    relative_filename = full_filename
  end

  local codeowners_path = "CODEOWNERS"
  local file = io.open(codeowners_path, "r")
  if not file then
    vim.notify("Couldn't open CODEOWNERS file.", vim.log.levels.ERROR)
    return
  end

  local owners = {}
  for line in file:lines() do
    local path_pattern, owners_str = line:match("^(%S+)%s+(.+)$")
    if path_pattern and full_filename:find(path_pattern) then
      owners = vim.split(owners_str, "%s+")
      break
    end
  end
  file:close()

  if #owners == 0 then
    vim.notify("No owners found for this file.", vim.log.levels.WARN)
  else
    local message = "File: "
      .. relative_filename
      .. "\n"
      .. "Package: "
      .. package_name
      .. "\n\n"
      .. table.concat(owners, "\n")
    vim.notify(message, vim.log.levels.INFO)
  end
end

function Go_to_test()
  local current_file = vim.fn.expand("%:p")
  local filetype = vim.bo.filetype
  local target_file

  local lang_map = {
    ruby = {
      test_dir = "/spec/",
      src_dir = "/app/",
      test_postfix = "_spec.rb",
      src_postfix = ".rb",
    },
    solidity = {
      test_dir = "/test/",
      src_dir = "/src/",
      test_postfix = ".t.sol",
      src_postfix = ".sol",
    },
  }

  local lang = lang_map[filetype]
  if not lang then
    vim.notify(("Unsupported file type: %s"):format(filetype))
    return
  end

  if current_file:match(lang.test_dir) then
    target_file = current_file:gsub(lang.test_dir, lang.src_dir):gsub(lang.test_postfix, lang.src_postfix)
  else
    target_file = current_file:gsub(lang.src_dir, lang.test_dir):gsub(lang.src_postfix, lang.test_postfix)
  end

  if vim.fn.filereadable(target_file) == 0 then
    vim.notify(("Can't find file: %s"):format(target_file))
  end

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
