return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    -- The `main` rewrite only installs parsers and queries; highlighting,
    -- folds and indent are switched on per buffer in the autocmd below.
    -- Needs the tree-sitter CLI (`brew install tree-sitter-cli`) and does not
    -- support lazy-loading.
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local ts = require 'nvim-treesitter'

      ts.install {
        'bash',
        'c',
        'go',
        'gomod',
        'gosum',
        'gowork',
        'html',
        'javascript',
        'json',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'ruby',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
      }

      -- Ruby's indent rules depend on vim's regex highlighting, so Ruby keeps
      -- `syntax` on alongside Treesitter and skips Treesitter indent.
      local regex_highlight = { ruby = true }

      local function attach(buf, lang)
        if not pcall(vim.treesitter.start, buf, lang) then
          return
        end
        if regex_highlight[lang] then
          vim.bo[buf].syntax = 'on'
        else
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('custom-treesitter', { clear = true }),
        callback = function(event)
          local lang = vim.treesitter.language.get_lang(event.match)
          if not lang then
            return
          end
          if vim.list_contains(ts.get_installed(), lang) then
            attach(event.buf, lang)
          elseif vim.list_contains(ts.get_available(), lang) then
            -- Autoinstall languages that are not installed yet
            ts.install(lang):await(function()
              if vim.api.nvim_buf_is_valid(event.buf) then
                attach(event.buf, lang)
              end
            end)
          end
        end,
      })
    end,
  },
}
