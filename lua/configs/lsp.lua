local configs = require "nvchad.configs.lspconfig"
local util = require "lspconfig/util";
local nvlsp = require "nvchad.configs.lspconfig"

nvlsp.defaults() -- loads nvchad's defaults

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  },
  gopls = {
    filetypes = { "go", "gomod", "templ" },
  },
  asm_lsp = {
    filetypes = { "asm", "s", "S", "asmx", "nasm" },
  },
  autotools_ls = {},
  dockerls = {},
  docker_compose_language_service = {},
  html = {},
  angularls = {},
  pyright = {},
  clangd = {},
  rust_analyzer = {
    filetypes = { "rust" },
    root_dir = util.root_pattern("Cargo.toml"),
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true
        }
      }
    }
  },
  marksman = {},
  omnisharp = {
    cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
    -- Enables support for reading code style, naming convention and analyzer
    -- settings from .editorconfig.
    enable_editorconfig_support = true,
    -- If true, MSBuild project system will only load projects for files that
    -- were opened in the editor. This setting is useful for big C# codebases
    -- and allows for faster initialization of code navigation features only
    -- for projects that are relevant to code that is being edited. With this
    -- setting enabled OmniSharp may load fewer projects and may thus display
    -- incomplete reference lists for symbols.
    enable_ms_build_load_projects_on_demand = true,
    -- Enables support for roslyn analyzers, code fixes and rulesets.
    enable_roslyn_analyzers = false,
    -- Specifies whether 'using' directives should be grouped and sorted during
    -- document formatting.
    organize_imports_on_format = true,
    -- Enables support for showing unimported types and unimported extension
    -- methods in completion lists. When committed, the appropriate using
    -- directive will be added at the top of the current file. This option can
    -- have a negative impact on initial completion responsiveness,
    -- particularly for the first few completion sessions after opening a
    -- solution.
    enable_import_completion = true,
    -- Specifies whether to include preview versions of the .NET SDK when
    -- determining which version to use for project loading.
    sdk_include_prereleases = true,
    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
    -- true
    analyze_open_documents_only = false,
    root_dir = function()
      return vim.loop.cwd() -- current working directory
    end
  },
  templ = {
    filetypes = { "html", "templ" },
  },
  -- htmx_lsp = {
  --   filetypes = { "html", "templ" },
  -- },
  tailwindcss = {
    filetypes = { "templ", "javascript", "typescript", "html" },
    init_options = { userLanguages = { templ = "html" } },
  },
  ansiblels = {},
  jdtls = {},
  intelephense = {},
  astro = {},
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end

require("typescript-tools").setup({})
