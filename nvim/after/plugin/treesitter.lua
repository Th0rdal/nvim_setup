local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then return end

treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = {"angular",
                      "arduino",
                      "asm",
                      "bash",
                      "c",
                      "c_sharp",
                      "cmake",
                      "comment",
                      "cpp",
                      "css",
                      "csv",
                      "cuda",
                      "devicetree",
                      "diff",
                      "disassembly",
                      "dockerfile",
                      "dot",
                      "doxygen",
                      "fortran",
                      "func",
                      "git_config",
                      "git_rebase",
                      "gitattributes",
                      "gitcommit",
                      "gitignore",
                      "go",
                      "gomod",
                      "gpg",
                      "graphql",
                      "groovy",
                      "html",
                      "htmldjango",
                      "http",
                      "hurl",
                      "ini",
                      "java",
                      "javascript",
                      "jsdoc",
                      "json",
                      "json5",
                      "kotlin",
                      "llvm",
                      "lua",
                      "luadoc",
                      "make",
                      "matlab",
                      "meson",
                      "nasm",
                      "nginx",
                      "objc",
                      "passwd",
                      "php",
                      "php_only",
                      "phpdoc",
                      "printf",
                      "properties",
                      "python",
                      "regex",
                      "rust",
                      "scala",
                      "sql",
                      "ssh_config",
                      "tmux",
                      "todotxt",
                      "typescript",
                      "typespec",
                      "typoscript",
                      "vim",
                      "vimdoc",
                      "vue",
                      "xcompose",
                      "xml",
                      "yaml",
                      "zig"
                    },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

