-- ~/projects/review.nvim/lua/review/init.lua
local M = {}

M.config = { base = "origin/main" }

local state = {}

local function git(args)
  return vim.fn.systemlist(vim.list_extend({ "git" }, args))
end

local function show()
  local sha = state.commits[state.idx]
  vim.cmd("Git checkout --quiet " .. sha)
  vim.cmd("checktime")
  vim.cmd("Gitsigns change_base " .. sha .. "~1 true")
  vim.cmd("Git difftool " .. sha .. "~1")
  local subject = git({ "log", "-1", "--format=%s", sha })[1] or ""
  print(("[%d/%d] %s"):format(state.idx, #state.commits, subject))
end

function M.start(base)
  if state.branch then M.stop() end
  base = base or M.config.base
  local commits = git({ "rev-list", "--reverse", base .. "..HEAD" })
  if vim.v.shell_error ~= 0 or #commits == 0 then
    return vim.notify("No commits between " .. base .. " and HEAD", vim.log.levels.WARN)
  end
  local branch = git({ "branch", "--show-current" })[1]
  state = {
    -- fall back to the sha if we started on a detached HEAD
    branch = (branch and branch ~= "") and branch or git({ "rev-parse", "HEAD" })[1],
    commits = commits,
    idx = 1,
  }
  show()
end

function M.next()
  if state.idx and state.idx < #state.commits then
    state.idx = state.idx + 1
    show()
  end
end

function M.prev()
  if state.idx and state.idx > 1 then
    state.idx = state.idx - 1
    show()
  end
end

function M.stop()
  if not state.branch then return end
  vim.cmd("Git checkout --quiet " .. state.branch)
  vim.cmd("checktime")
  vim.cmd("Gitsigns reset_base true")
  state = {}
end

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
  local cmd = vim.api.nvim_create_user_command
  cmd("ReviewStart", function(o)
    M.start(o.args ~= "" and o.args or nil)
  end, { nargs = "?", desc = "Review PR commits one at a time" })
  cmd("ReviewNext", M.next, { desc = "Review the next commit" })
  cmd("ReviewPrev", M.prev, { desc = "Review the previous commit" })
  cmd("ReviewStop", M.stop, { desc = "Stop reviewing and restore the branch" })
end

return M
