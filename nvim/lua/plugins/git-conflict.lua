return {
    "akinsho/git-conflict.nvim",
    tag = "v2.1.0",
    config = function()
      require("git-conflict").setup()

      local function apply_conflict_hl()
        -- 1) current label same as incoming label
        vim.api.nvim_set_hl(0, "GitConflictCurrentLabel", { link = "GitConflictIncomingLabel" })

        -- 2) remove the rest highlights
        -- clear block highlights
        vim.api.nvim_set_hl(0, "GitConflictCurrent", {})
        vim.api.nvim_set_hl(0, "GitConflictIncoming", {})
        vim.api.nvim_set_hl(0, "GitConflictAncestor", {})

        -- clear the other labels (keep only incoming + current-linked-to-incoming)
        vim.api.nvim_set_hl(0, "GitConflictAncestorLabel", {})
        -- (optional) if you also want to remove incoming label styling entirely:
        -- vim.api.nvim_set_hl(0, "GitConflictIncomingLabel", {})
      end

      apply_conflict_hl()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_conflict_hl })
    end,
  }
