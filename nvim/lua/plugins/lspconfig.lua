-- local HOME = os.getenv("HOME")
return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Setup language servers.
    -- local lspconfig = require("lspconfig")
    -- require("clangd_extensions.inlay_hints").setup_autocmd()
    -- require("clangd_extensions.inlay_hints").set_inlay_hints()

    -- lspconfig.setup({ sources = { name = "nvim_lsp_signature_help" } })
    local caps = vim.lsp.protocol.make_client_capabilities()
    pcall(function()
      caps = require("cmp_nvim_lsp").default_capabilities(caps)
    end)
    vim.lsp.config['clangd'] = {
      on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable(true)
      end,
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--cross-file-rename",
        "--header-insertion=iwyu",
        -- "--all-scopes-completion",
        "--fallback-style=llvm",
        "--function-arg-placeholders",
        "-j12",
      },
    }

    vim.lsp.config['pyright'] = {}
    vim.lsp.config['ts_ls'] = {}
    vim.lsp.config['yamlls'] = {}
    vim.lsp.config['lua_ls'] = {}
    vim.lsp.config['jsonls'] = {}
    vim.lsp.config['rust_analyzer'] = {
      -- Server-specific settings. See `:help lspconfig-setup`
      settings = {
        ["rust-analyzer"] = {},
      },
    }
    vim.lsp.config['bashls'] = {}
    vim.lsp.config['cmake'] = {}

    -- local configs = require("lspconfig.configs")
    -- if not configs.mlir_lsp then
    --   configs.mlir_lsp = {
    --     default_config = {
    --       cmd = { vim.fn.expand("$HOME/llvm-project/bin/mlir-lsp-server") },
    --       root_dir = vim.lsp.config['util'].root_pattern(".git"),
    --       filetypes = { "mlir" },
    --     },
    --   }
    -- end
    vim.lsp.config["mlir_lsp"] = {
      capabilities = caps,
      cmd = { vim.fn.expand("$HOME/llvm-project/bin/mlir-lsp-server") },
      filetypes = { "mlir" },
      root_markers = { ".git" },
    }

    vim.lsp.config["tblgen_lsp"] = {
      capabilities = caps,
      cmd = {
        vim.fn.expand("$HOME/llvm-project/bin/tblgen-lsp-server"),
        "--tablegen-compilation-database=./tablegen_compile_commands.yml",
      },
      filetypes = { "tablegen" },
      root_markers = { ".git" },
    }

    -- if not configs.tblgen_lsp then
    --   configs.tblgen_lsp = {
    --     default_config = {
    --       -- root_dir = lspconfig.util.root_pattern(".git"),
    --       -- root_dir = vim.lsp.config.util.root_pattern(".git"),
    --       root_dir = vim.lsp.config['util'].root_pattern(".git"),
    --       cmd = {
    --         vim.fn.expand("$HOME/llvm-project/bin/tblgen-lsp-server"),
    --         "--tablegen-compilation-database=./tablegen_compile_commands.yml",
    --       },
    --       filetypes = { "tablegen" },
    --     },
    --   }
    -- end
    -- tblgen-lsp-server

    vim.lsp.config['mlir_lsp'] = {}
    vim.lsp.config['tblgen_lsp'] = {}

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
    -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    -- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set("n", "<space>wl", function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        -- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        -- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
        -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        -- vim.keymap.set("n", "<space>f", function()
        --   vim.lsp.buf.format({ async = true })
        -- end, opts)
      end,
    })

    vim.o.updatetime = 250
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
      end,
    })
  end,
}
