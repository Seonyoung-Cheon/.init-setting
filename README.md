# Initial Setting
```
./init-install.sh 
source ./zsh-setting.sh
./neovim-setting.sh
```

// vim-setting is deprecated

# User should modify theses
* llvm-project location in ~/.config/nvim/lua/plugins/lspconfig.lua\
  1) vim.fn.expand("$HOME/llvm-project/bin/mlir-lsp-server") },\
  2) vim.fn.expand("$HOME/llvm-project/bin/tblgen-lsp-server"),
 

# Commands
--------

| Command               | Shortcut	| List                                                              | Plugin            |
| ---                   | ---     	| ---                                                               | ---               |
| `:Files [PATH]`       | `,,f`		| Files (runs `$FZF_DEFAULT_COMMAND` if defined)                    | junegunn/fzf.vim  |
| `:GFiles?`            | `,,g`		| Git files (`git status`)                                          | junegunn/fzf.vim  |
| `:Buffers`            | `,,b`         | Open buffers                                                      | junegunn/fzf.vim  |
| `:Colors`             | 		| Color schemes                                                     | junegunn/fzf.vim  |
| `:Rg [PATTERN]`       | 		| [rg][rg] search result                                            | junegunn/fzf.vim  |
| Comments out         	| `gcgc`	| Comments out for a line	                                    | tpope/vim-commentary  |
| Comments out          | `gc`		| Comments out for several line	                                    | tpope/vim-commentary  |
| Comments out          | `gcap`	| Comments out for a paragraph	                                    | tpope/vim-commentary  |
| `:Git`          	| `:G`		| Open Git-fugitive		                                    | tpope/vim-fugitive  |
| Git Commands          | Refer to site	| [Shortcuts](https://cheatography.com/isaacnewton/cheat-sheets/fugitive/)       | tpope/vim-fugitive  |
| `:ClangFormat`        | `,cf`		| Apply ClangFormat to Current Buffer(file) - normal mode           | rhysd/vim-clang-format  |
| `:<, >ClangFormat`    | `,cf`		| Apply ClangFormat to Selected Lines - visual mode                 | rhysd/vim-clang-format  |
| `:YcmCompleter GoTo`  | `gd`		| Go to Definition - normal mode		                    | ycm-core/youcompleteme  |
| Back			| `ctrl + o`    | Return from definition - normal mode		                    |  - |
| `:NerdTreeToggle`     | `,n`    | Open NerdTree on side		                    		    | preservim/nerdtree |
| `:NerdTreeRefreshRoot`| `,r` 	        | Refresh NerdTree		                    		    | preservim/nerdtree |


--------
Commands will be added..
