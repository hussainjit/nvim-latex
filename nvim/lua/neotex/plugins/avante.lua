return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- Using latest version to get the most recent fixes
  -- version = "*", -- Using latest version to get the most recent fixes
  init = function()
    -- Create autocmd for Avante buffer-specific mappings
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "AvanteInput", "Avante" },
      callback = function()
        -- Create buffer-local insert mode mapping for toggle
        vim.api.nvim_buf_set_keymap(0, "i", "<C-t>", "<cmd>AvanteToggle<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, "n", "<C-t>", "<cmd>AvanteToggle<CR>", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>AvanteToggle<CR>", { noremap = true, silent = true })
        -- Add mapping to clear selected text
        vim.api.nvim_buf_set_keymap(0, "n", "<C-c>", "<cmd>AvanteReset<CR>", { noremap = true, silent = true })
        -- Set scrolloff to keep cursor in the middle
        vim.opt_local.scrolloff = 999
      end
    })
  end,
  opts = {
    provider = "claude",
    auto_suggestions_provider = "claude",
    prompts = {
      ask = {
        system = "You are an expert mathematician, logician and computer scientist.",
        user = "{{input}}",
      },
      suggest = {
        system = "You are an expert mathematician, logician and computer scientist.",
        user = "{{input}}",
      },
    },
    claude = {
      endpoint = "https://api.anthropic.com",
      -- model = "claude-3-opus-20240229",
      model = "claude-3-5-sonnet-20241022",
      -- model = "claude-3-sonnet-20240229",
      temperature = 0,
      max_tokens = 4096,
    },
    dual_boost = {
      enabled = false,
      first_provider = "claude",
      second_provider = "openai",
      prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
      timeout = 60000,
    },
    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = false,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
      minimize_diff = true,
      preserve_state = true,
    },
    mappings = {
      diff = {
        ours = "o",
        theirs = "t",
        all_theirs = "a",
        both = "b",
        cursor = "c",
        next = "<C-j>",
        prev = "<C-k>",
      },
      suggestion = {
        accept = "<C-l>",
        next = "<C-j>",
        prev = "<C-k>",
        dismiss = "<C-h>",
      },
      jump = {
        next = "n",
        prev = "N",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-l>",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },
    hints = { enabled = false },
    windows = {
      position = "right",
      wrap = true,
      width = 40,
      sidebar_header = {
        enabled = true,
        align = "left",
        rounded = false,
      },
      input = {
        rounded = true,
        prefix = "󰭹 ",
        height = 8,
      },
      edit = {
        border = "rounded",
        start_insert = true,
      },
      ask = {
        floating = false,
        start_insert = true,
        border = "rounded",
        focus_on_apply = "ours",
      },
    },
    highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    diff = {
      autojump = true,
      list_opener = "copen",
      override_timeoutlen = 500,
    },
  },
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-tree/nvim-web-devicons",
    -- "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
