{ ... }:
{
  plugins = {
    # GitHub Copilot (core & inline ghost text suggestions)
    copilot-lua = {
      enable = true;
      settings = {
        suggestion = {
          enabled = true;
          auto_trigger = true;
          hide_during_completion = true;
          debounce = 75;
          keymap = {
            accept = "<M-l>";
            accept_word = "<M-w>";
            accept_line = "<M-j>";
            next = "<M-]>";
            prev = "<M-[>";
            dismiss = "<C-]>";
          };
        };
        panel = {
          enabled = false;
        };
      };
    };

    # GitHub Copilot Chat
    copilot-chat = {
      enable = true;
      settings = {
        window = {
          layout = "vertical";
          width = 0.4;
        };
        auto_insert_mode = false;
        show_help = true;
        question_header = "## User ";
        answer_header = "## Copilot ";
        error_header = "## Error ";
      };
    };
  };

  keymaps = [
    # Copilot inline suggestion keymap: accept with Tab if visible, fallback to normal Tab
    {
      mode = "i";
      key = "<Tab>";
      action.__raw = ''
        function()
          local suggestion = package.loaded["copilot.suggestion"] or (pcall(require, "copilot.suggestion") and require("copilot.suggestion"))
          if suggestion and suggestion.is_visible() then
            suggestion.accept()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
          end
        end
      '';
      options = {
        silent = true;
        desc = "Copilot accept suggestion or Tab";
      };
    }

    # CopilotChat keymaps
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cc";
      action = "<cmd>CopilotChatToggle<CR>";
      options = {
        silent = true;
        desc = "CopilotChat toggle";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>ce";
      action = "<cmd>CopilotChatExplain<CR>";
      options = {
        silent = true;
        desc = "CopilotChat explain code";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cr";
      action = "<cmd>CopilotChatReview<CR>";
      options = {
        silent = true;
        desc = "CopilotChat review code";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cx";
      action = "<cmd>CopilotChatFix<CR>";
      options = {
        silent = true;
        desc = "CopilotChat fix bug";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>ct";
      action = "<cmd>CopilotChatTests<CR>";
      options = {
        silent = true;
        desc = "CopilotChat generate tests";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cd";
      action = "<cmd>CopilotChatDocs<CR>";
      options = {
        silent = true;
        desc = "CopilotChat generate docs";
      };
    }
    {
      mode = "n";
      key = "<leader>cm";
      action = "<cmd>CopilotChatCommit<CR>";
      options = {
        silent = true;
        desc = "CopilotChat commit message";
      };
    }
    {
      mode = "n";
      key = "<leader>cq";
      action = "<cmd>CopilotChatReset<CR>";
      options = {
        silent = true;
        desc = "CopilotChat reset chat";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cp";
      action = "<cmd>CopilotChatPrompts<CR>";
      options = {
        silent = true;
        desc = "CopilotChat prompt actions";
      };
    }
  ];
}
