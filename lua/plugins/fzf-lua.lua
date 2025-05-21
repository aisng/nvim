return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    local fzf = require("fzf-lua")
    local actions = fzf.actions

    opts.files = opts.files or {}
    opts.files.actions = opts.files.actions or {}
    opts.files.actions["default"] = actions.file_edit

    return opts
  end,
}
