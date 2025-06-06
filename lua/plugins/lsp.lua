return {
  -- Add all language servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Go
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        },
        -- Python with uv package manager
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        -- For Astro
        astro = {},
        -- For Svelte
        svelte = {},
        -- For Deno
        denols = {
          root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
        },
        -- For Bun/Node.js
        tsserver = {
          root_dir = require("lspconfig.util").root_pattern("package.json"),
          single_file_support = false,
        },

        -- Infrastructure tools
        terraformls = {}, -- Terraform
        tflint = {}, -- Terraform linter
        ansiblels = {}, -- Ansible
        dockerls = {}, -- Docker
        docker_compose_language_service = {}, -- Docker Compose
        yamlls = { -- YAML (for Kubernetes manifests)
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://json.schemastore.org/ansible-playbook.json"] = "playbook*.yml",
                ["https://json.schemastore.org/ansible-role-task.json"] = "roles/*/tasks/*.yml",
              },
              format = { enable = true },
              validate = true,
              completion = true,
            },
          },
        },

        -- PHP
        intelephense = {
          settings = {
            intelephense = {
              stubs = {
                "apache",
                "bcmath",
                "bz2",
                "calendar",
                "com_dotnet",
                "Core",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "fileinfo",
                "filter",
                "fpm",
                "ftp",
                "gd",
                "gettext",
                "gmp",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "mcrypt",
                "mysql",
                "mysqli",
                "oci8",
                "openssl",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_mysql",
                "Phar",
                "posix",
                "pspell",
                "readline",
                "recode",
                "Reflection",
                "regex",
                "session",
                "shmop",
                "SimpleXML",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "sqlite3",
                "standard",
                "superglobals",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tidy",
                "tokenizer",
                "xml",
                "xmlreader",
                "xmlrpc",
                "xmlwriter",
                "xsl",
                "Zend OPcache",
                "zip",
                "zlib",
              },
              environment = {
                phpVersion = "8.2.0",
              },
              format = {
                enable = true,
              },
            },
          },
        },

        -- Java
        jdtls = {}, -- Will be configured with a more detailed setup

        -- C/C++
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--suggest-missing-includes",
            "--clang-tidy",
            "--header-insertion=iwyu",
          },
        },

        -- Rust
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                command = "clippy",
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },

        -- Zig
        zls = {},
      },
    },
  },

  -- Add Mason ensure installed servers
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Existing languages
        "gopls",
        "pyright",
        "astro-language-server",
        "svelte-language-server",
        "deno",
        "typescript-language-server",
        "lua-language-server",
        "stylua",
        "shfmt",
        "shellcheck",
        "prettier",

        -- Infrastructure tools
        "terraform-ls",
        "tflint",
        "ansible-language-server",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "yaml-language-server",
        "hadolint",
        "ansible-lint",

        -- PHP
        "intelephense",
        "php-cs-fixer",
        "phpstan",

        -- Java
        "jdtls",
        "java-debug-adapter",
        "java-test",

        -- C/C++
        "clangd",
        "clang-format",

        -- Rust
        "rust-analyzer",
        "rustfmt",

        -- Zig
        "zls",
      },
    },
  },

  -- Configure formatter
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        -- Go
        go = { "gofumpt", "goimports" },

        -- Python
        python = { "black", "isort" },

        -- Web development
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        astro = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },

        -- Infrastructure
        terraform = { "terraform_fmt" },
        hcl = { "terraform_fmt" },
        yaml = { "prettier" },
        docker = { "hadolint" },
        dockerfile = { "hadolint" },

        -- PHP
        php = { "php_cs_fixer" },

        -- C/C++
        c = { "clang_format" },
        cpp = { "clang_format" },

        -- Rust
        rust = { "rustfmt" },

        -- Zig
        zig = { "zigfmt" },

        -- Lua
        lua = { "stylua" },

        -- Shell
        sh = { "shfmt" },
      },
      formatters = {
        -- You can add custom formatter configurations here if needed
        -- For example:
        php_cs_fixer = {
          args = { "--rules=@PSR12" },
        },
      },
    },
  },

  -- Configure linter
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        -- Go
        go = { "golangcilint" },

        -- Python
        python = { "flake8", "mypy" },

        -- Infrastructure
        terraform = { "tflint" },
        dockerfile = { "hadolint" },
        yaml = { "yamllint" },

        -- PHP
        php = { "phpstan" },

        -- Shell
        sh = { "shellcheck" },

        -- Ansible
        ansible = { "ansible_lint" },

        -- TypeScript/JavaScript
        typescript = { "eslint" },
        javascript = { "eslint" },
      },
      -- You can add custom linter configurations here if needed
    },
  },

  -- Add special Java configuration (jdtls needs special setup)
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    opts = {
      -- The command that starts the language server
      cmd = {
        "jdtls",
        -- These will be filled when the server starts
      },
      -- This is the default if not provided
      root_dir = function(fname)
        return require("lspconfig.util").root_pattern("pom.xml", "gradle.build", ".git")(fname) or vim.fn.getcwd()
      end,
    },
    config = function(_, opts)
      -- The config is automatically applied when the server starts
      local on_attach = function(client, bufnr)
        -- The modern way to set omnifunc
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Java-specific mappings
        vim.keymap.set(
          "n",
          "<leader>ji",
          "<cmd>lua require('jdtls').organize_imports()<CR>",
          { buffer = bufnr, desc = "Organize Imports" }
        )
        vim.keymap.set(
          "n",
          "<leader>jt",
          "<cmd>lua require('jdtls').test_class()<CR>",
          { buffer = bufnr, desc = "Test Class" }
        )
        vim.keymap.set(
          "n",
          "<leader>jn",
          "<cmd>lua require('jdtls').test_nearest_method()<CR>",
          { buffer = bufnr, desc = "Test Nearest Method" }
        )
      end

      -- Attach the language server to Java files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          local jdtls = require("jdtls")
          local jdtls_setup = require("jdtls.setup")

          -- Set up Java project-specific settings
          local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
          local workspace_dir = vim.fn.expand("~/.cache/jdtls/workspace/") .. project_name

          -- Setup configuration with all options
          local config = {
            cmd = {
              "jdtls",
              "--jvm-arg=-Xmx1G",
              "--jvm-arg=-XX:+UseG1GC",
              "--jvm-arg=-XX:MaxGCPauseMillis=100",
              "-data",
              workspace_dir,
            },
            root_dir = jdtls_setup.find_root({ "pom.xml", "gradle.build", ".git" }),
            settings = {
              java = {
                signatureHelp = { enabled = true },
                contentProvider = { preferred = "fernflower" },
                completion = {
                  favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.junit.Assert.*",
                    "org.junit.Assume.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                  },
                  filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*",
                    "sun.*",
                  },
                },
                sources = {
                  organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                  },
                },
                codeGeneration = {
                  toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                  },
                  hashCodeEquals = {
                    useJava7Objects = true,
                  },
                  useBlocks = true,
                },
                configuration = {
                  runtimes = {
                    {
                      name = "JavaSE-17",
                      path = vim.fn.expand("~/.sdkman/candidates/java/17.0.6-tem"),
                    },
                    {
                      name = "JavaSE-11",
                      path = vim.fn.expand("~/.sdkman/candidates/java/11.0.18-tem"),
                    },
                    {
                      name = "JavaSE-1.8",
                      path = vim.fn.expand("~/.sdkman/candidates/java/8.0.362-tem"),
                    },
                  },
                },
              },
            },
            on_attach = on_attach,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            init_options = {
              bundles = {},
            },
          }

          -- Start the Java language server with the configuration
          jdtls.start_or_attach(config)
        end,
      })
    end,
  },
}
