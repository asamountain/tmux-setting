return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  opts = {
    provider = "claude",
    claude = {
      model = "claude-sonnet-4-6",
      max_tokens = 4096,
      parse_curl_args = function(opts, code_opts)
        local claude = require("avante.providers.claude")
        local result = claude.parse_curl_args(opts, code_opts)
        result.rawArgs = result.rawArgs or {}
        table.insert(result.rawArgs, "--http1.1")
        -- Fix stale tool type: plugin maps claude-sonnet-4 to text_editor_20250429
        -- but claude-sonnet-4-6 requires text_editor_20250728
        if type(result.body) == "table" and result.body.tools then
          for _, tool in ipairs(result.body.tools) do
            if tool.type == "text_editor_20250429" then
              tool.type = "text_editor_20250728"
            end
          end
        end
        return result
      end,
    },
  },
  keys = {
    { "<leader>aa", function() require("avante.api").ask() end, desc = "avante: ask", mode = { "n", "v" } },
    { "<leader>ae", function() require("avante.api").edit() end, desc = "avante: edit", mode = "v" },
    { "<leader>ar", function() require("avante.api").refresh() end, desc = "avante: refresh" },
    { "<leader>at", function() require("avante").toggle() end, desc = "avante: toggle" },
    { "<leader>af", function() require("avante.api").focus() end, desc = "avante: focus" },
    { "<leader>an", function() require("avante.api").ask({ new_chat = true }) end, desc = "avante: new ask", mode = { "n", "v" } },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = { file_types = { "markdown", "Avante" } },
      ft = { "markdown", "Avante" },
    },
  },
}
