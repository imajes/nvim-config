local lspkind = require('lspkind')

local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  cmp_tabnine = "[TN]",
  path = "[Path]",
}

-- setup cmp_tabnine
local tabnine = require('cmp_tabnine.config')

tabnine:setup({
  max_lines = 1000;
  max_num_results = 20;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placeholder = '..';
  ignored_file_types = { -- default is not to ignore
  -- uncomment to ignore in lua:
  -- lua = true
};
  })

  -- define our own sorting
  local compare = require('cmp.config.compare')

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'cmp_tabnine' },
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    },
    {
      { name = 'buffer' },
    }),
    sorting = {
      priority_weight = 2,
      comparators = {
        require('cmp_tabnine.compare'),
        compare.offset,
        compare.exact,
        compare.score,
        compare.recently_used,
        compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      },
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind]
        local menu = source_mapping[entry.source.name]
        if entry.source.name == 'cmp_tabnine' then
          if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
            menu = entry.completion_item.data.detail .. ' ' .. menu
          end
          vim_item.kind = ''
        end
        vim_item.menu = menu
        return vim_item
      end
    },
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source https://github.com/hrsh7th/cmp-git/
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --   capabilities = capabilities
  -- }
