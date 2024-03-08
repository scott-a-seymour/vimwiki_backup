Most ordinary (a.k.a., unmodified) keybindings work as normal in a NeoTree sidebar.
### General
| Mode           | Keybind             | Mapped To                             | Notes                                                    |
| :---           | :---                | :---                                  | :---                                                     |
| Normal         | `,`                 | leader                                | Followed by something else within about 2 seconds        |
| Normal         | `jk`                | `<Esc>`                               | Both letters typed within about 2 seconds                |
| Normal         | `<C-h>`             | `<C-w>h`                              | Move across splits like in a buffer                      |
| Normal         | `<C-j>`             | `<C-w>j`                              | ...                                                      |
| Normal         | `<C-k>`             | `<C-w>k`                              | ...                                                      |
| Normal         | `<C-l>`             | `<C-w>l`                              | ...                                                      |
| Insert         | `<leader>(`         | `()<esc>i`                            | Insert () and edit inside                                |
| Insert         | `<leader>{`         | `{}<esc>i`                            | Insert {} and edit inside                                |
| Insert         | `<leader>[`         | `[]<esc>i`                            | Insert [] and edit inside                                |
| Insert         | `<leader>"`         | `""<esc>i`                            | Insert "" and edit inside (double-quotes)                |
| Insert         | `<leader>'`         | `''<esc>i`                            | Insert '' and edit inside (single-quotes)                |
| Insert         | ``<leader>` ``      | `` ` ` <esc>i``                       | Insert ` ` and edit inside (backticks)                   |
| Visual         | `$1`                | ``<esc>`>a)<esc>`<i(<esc>``           | Wrap visually selected in ()                             |
| Visual         | `$2`                | ``<esc>`>a}<esc>`<i{<esc>``           | Wrap visually selected in {}                             |
| Visual         | `$3`                | ``<esc>`>a]<esc>`<i[<esc>``           | Wrap visually selected in []                             |
| Visual         | `$4`                | ``<esc>`>a"<esc>`<i"<esc>``           | Wrap visually selected in "" (double-quotes)             |
| Visual         | `$5`                | ``<esc>`>a'<esc>`<i'<esc>``           | Wrap visually selected in '' (single-quotes)             |
| Normal         | `<C-n>`             | `:Neotree filesystem reveal left<CR>` | Open a NeoTree file browser sidebar on the left          |
| Normal         | `<leader>gf`        | `vim.lsp.buf.format`                  | Apply LSP-based formatting to current file, if it exists |
| Visual, Normal | `gcc`               | `:CommentToggle`                      | Toggle commenting on current line                        |
| Visual, Normal | `gc{motion}`        | `:CommentToggle`                      | Toggle commenting on multiple lines                      |
| Visual, Normal | `gc{count}{motion}` | `:CommentToggle`                      | Toggle commenting on multiple lines                      |

### Completions popup window
| Mode | Keybind     | Mapped To                              | Notes                                    |
| :--- | :---        | :---                                   | :---                                     |
|      | `<C-b>`     | cmp.mapping.scroll_docs(-4)            | Scroll backwards                         |
|      | `<C-f>`     | cmp.mapping.scroll_docs(4)             | Scroll forwards                          |
|      | `<C-Space>` | cmp.mapping.complete()                 | Dismiss popup without selecting anything |
|      | `<C-e>`     | cmp.mapping.abort()                    | Ignore completion choice; close popup    |
|      | `<CR>`      | cmp.mapping.confirm({ select = true }) | Accept highlighted choice                |

### Git integration
| Mode   | Keybind       | Mapped To                                 | Notes                                         |
| :---   | :---          | :---                                      | :---                                          |
| Normal | `<leader>ph`  | `:Gitsigns preview_hunk<CR>`              | Preview hunk to be changed                    |
| Normal | `<leader>gt`  | `:Gitsigns toggle_current_line_blame<CR>` | Toggle blame visibility when paused on a line |
| Normal | `<leader>git` | `:LazyGit<CR>`                            | Open LazyGit inside Neovim                    |


### Mason
These require the active buffer to contain a file in a language that has LSP information installed.
| Mode   | Keybind      | Mapped To                 | Notes                                                  |
| :---   | :---         | :---                      | :---                                                   |
| Normal | `K`          | `vim.lsp.buf.hover`       | While cursor is on something, get LSP-based help       |
| Normal | `gd`         | `vim.lsp.buf.definition`  | While cursor is on something, get LSP-based definition |
| Normal | `<leader>ca` | `vim.lsp.buf.code_action` | LSP-based code actions                                 |

### Telescope
| Mode   | Keybind      | Mapped To                      | Notes                             |
| :---   | :---         | :---                           | :---                              |
| Normal | `<leader>ff` | `telescope.builtin.find_files` | Commonly used Telescope functions |
| Normal | `<leader>fg` | `telescope.builtin.live_grep`  |                                   |
| Normal | `<leader>fb` | `telescope.builtin.buffers`    |                                   |
| Normal | `<leader>fh` | `telescope.builtin.help_tags`  |                                   |

### Type Converter
This works in the command bar. The plugin expects to see some value after the command, in standard formatting style (0x#
for hex, O# for octal, 0b# for binary)
| Mode   | Keybind      | Mapped To                | Notes                                           |
| :---   | :---         | :---                     | :---                                            |
| Normal | `<leader>Cd` | `:<C-u>ConvDec<Space>`   | Convert the text after to decimal               |
| Normal | `<leader>Ch` | `:<C-u>ConvHex<Space>`   | Convert the text after to hexadecimal           |
| Normal | `<leader>Co` | `:<C-u>ConvOct<Space>`   | Convert the text after to octal                 |
| Normal | `<leader>Cb` | `:<C-u>ConvBin<Space>`   | Convert the text after to binary                |
| Normal | `<leader>Cs` | `:<C-u>ConvStr<Space>`   | Convert the text after to a string              |
| Normal | `<leader>Ct` | `:<C-u>ConvBytes<Space>` | Convert the text after to a byte representation |

### VimWiki
Set up to use regular markdown, not built in version of markdown.
| Mode   | Keybind       | Mapped To                      | Notes                                     |
| :---   | :---          | :---                           | :---                                      |
| Normal | `<leader>ww`  | Open index file                | Set to ~/Documents/vimwiki                |
| Normal | `<leader>ws`  | Open selected index file       |                                           |
| Normal | `<Enter>`     | Follow/create link             | Automatically appends `.md` when creating |
| Normal | `<Backspace>` | Goto parent (or previous) link |                                           |
| Normal | `<Tab>`       | Find next link                 |                                           |
| Normal | `<Shift-Tab>` | Find previous link             |                                           |

| Mode   | Command               | What it does                      | Notes                              |
| :---   | :---                  | :---                              | :---                               |
| Normal | `:Vimwiki2HTML`       | Convert current wiki page to HTML | Doesn't work with regular Markdown |
| Normal | `:VimwikiAll2HTML`    | Convert all wiki pages to HTML    | Same                               |
| Normal | `:h vimwiki-commands` | List all vimwiki commands         |                                    |

### Base64 converter
| Mode   | Keybind     | Mapped To            | Notes                          |
| :---   | :---        | :---                 | :---                           |
| Visual | `<leader>b` | "<Plug>(FromBase64)" | Base64 DEcode highlighted text |
| Visual | `<leader>B` | "<Plug>(ToBase64)"   | Base64 ENcode highlighted text |

### Hex editor
| Mode   | Keybind      | Mapped To          | Notes                               |
| :---   | :---         | :---               | :---                                |
| Visual | `<leader>hd` | ":HexDump<CR>"     | Switch to hex view                  |
| Visual | `<leader>ha` | ":HexAssemble<CR>" | Switch to normal view               |
| Visual | `<leader>ht` | ":HexToggle<CR>"   | Toggle between normal and hex views |
