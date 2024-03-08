# Making Work Easier
This is a list of shortcuts, functions, aliases, etc. that are available on my AWS instance.

-----
## Bash/ Terminal
### General
| Alias                       | What It Does                                                                                                                          |
| :---                        | :---                                                                                                                                  |
| `d`                         | `docker`                                                                                                                              |
| `egrep`                     | `egrep --color=auto`                                                                                                                  |
| `fgrep`                     | `fgrep --color=auto`                                                                                                                  |
| `grep`                      | `grep --color=auto`                                                                                                                   |
| `l`                         | `ls -CF`                                                                                                                              |
| `la`                        | `ls -A`                                                                                                                               |
| `lc`                        | `clear; pwd; ls -la`                                                                                                                  |
| `ll`                        | `ls -alF`                                                                                                                             |
| `ls`                        | `ls --color=auto`                                                                                                                     |
| `reload`                    | `source ~/.bashrc`                                                                                                                    |
| `vim`                       | `nvim-qt`                                                                                                                             |
| `./Documents/clusters.sh`   | Opens TMux with multiple windows to Test/Stage : Red/Black.                                                                           |
| `./Documents/watch_flux.sh` | Opens TMux with multiple windows to Test/Stage : Red/Black in such a way as to make monitoring progress of fluxing the clusters easy. |
| `attach <session name>`     | Open (attach to) an TMux `<session name>`

### kubectl
| Alias             | What It Does                  |
| :---              | :---                          |
| `k`               | `kubectl`                     |
| `kgp`             | `k get pods`                  |
| `k_list_contexts` | `kubectl config get-contexts` |

| Function            | What It Does                                                                                                    |
| :---                | :---                                                                                                            |
| `ktl <time>`        | Grab all pod logs from the active namespace. `<time>` is a string like `60s` or `2h`.                           |
| `k_bash`            | Open up an interactive bash shell with a given generically named pod                                            |
| `k_busy_logs`       | Tail the last 20 logs of a given pod with follow set to false.                                                  |
| `k_cm`              | Grab a given config map                                                                                         |
| `k_context`         | Switch to a given context if one is provided, list the active context otherwise.                                |
| `k_describe_pod $1` | `kubectl describe pod $1` where `$1` is a pod name.                                                             |
| `k_down`            | Scale a given deployment to 0                                                                                   |
| `k_edit_cm`         | Edit a given config map                                                                                         |
| `k_get_node`        | Get the node port of a given pod                                                                                |
| `k_kill_pod`        | `kubectl delete pod $1 --grace-period=0 --force`                                                                |
| `k_logs`            | Given a generic pod name, i.e. jh-manager, grab the fully qualified pod name and follow the logs.               |
| `k_namespace`       | Switch to a given namespace if one is provided, list the active namespace otherwise                             |
| `k_overrides $1`    | `helm get values "$1"` where `$1` is a helm release name                                                        |
| `k_pods`            | Get pods in a namespace                                                                                         |
| `k_status`          | `watch -t kubectl get pods -o custom-columns="NAME:metadata.name,STATUS:status.phase" --sort-by=.metadata.name` |
| `k_toggle`          | Scale a given pod to 0 replicas and then back up to 1.                                                          |
| `k_up`              | Scale a given deployment to 1                                                                                   |

| Command                                                  | What It Does                                              |
| :---                                                     | :---                                                      |
| `k cp <namespace>/<pod>:<path to source> <path to dest>` | Copy files and folders from a pod to local space          |
| `k logs <pod name> > <destination name>`                 | Copy snapshot of log for `pod name` to `destination name` |


### git
| Alias       | What It Does                           |
| :---        | :---                                   |
| `branch`    | `git branch `                          |
| `co`        | `git checkout `                        |
| `log`       | `remote_up; git log --oneline --graph` |
| `remote`    | `git remote`                           |
| `remote_up` | `git remote update`                    |
| `status`    | `git status`                           |

### Tmux
`<leader>` keybinding is `<C-q>`
| Session Commands                   | What It Does                                   |
| :---                               | :---                                           |
| `<leader>d`                        | Detach from session (exit without closing)     |
| `tmux a -t <sess_name>`            | Open existing Tmux session named `<sess_name>` |
| `tmux kill-ses -t <sess_name>`     | Kill (close) named session                     |
| `tmux kill-session -t <sess_name>` | Kill (close) named session                     |
| `tmux ls`                          | Display existing sessions                      |
| `tmux new -s <sess_name>`          | Open a new Tmux session named `<sess_name>`    |
| `<leader>(`                        | Move to previous session                       |
| `<leader>)`                        | Move to next session                           |
| `<leader>f`                        | Find window                                    |


| Window Commands    | What It Does                |
| :---               | :---                        |
| `<leader>c`        | Create new window           |
| `<leader>,`        | Rename current window       |
| `<leader>&`        | Close current window        |
| `<leader>w`        | List windows                |
| `<leader>p`        | Previous window             |
| `<leader>n`        | Next window                 |
| `<leader><number>` | Switch to window `<number>` |
| `<leader>l`        | Last window                 |


| Pane Commands             | What It Does                                           |
| :---                      | :---                                                   |
| `<leader>;`               | Last active pane                                       |
| `<leader>\| `             | Split pane vertically                                  |
| `<leader>-`               | Split pane horizontally                                |
| `<leader>{`               | Move current pane left                                 |
| `<leader>}`               | Move current pane right                                |
| `<leader>h`               | Move to pane left                                      |
| `<leader>j`               | Move to pane down                                      |
| `<leader>k`               | Move to pane up                                        |
| `<leader>l`               | Move to pane right                                     |
| `<leader><space>`         | Cycle through pane layouts                             |
| `<leader>o`               | Next pane                                              |
| `<leader>q`               | Show pane numbers                                      |
| `<leader>q <number>`      | Switch to pane `<number>`                              |
| `<leader>!`               | Convert pane to window                                 |
| `<leader>x`               | Close current pane                                     |
| `:setw synchronize-panes` | Send command to all panes                              |
| `<C-h>`                   | `:setw synchronize-panes` 󱦰  Send command to all panes |

-----
-----
## Neovim Keybindings
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
| Mode   | Keybind      | Mapped To                                 | Notes                                         |
| :---   | :---         | :---                                      | :---                                          |
| Normal | `<leader>ph` | `:Gitsigns preview_hunk<CR>`              | Preview hunk to be changed                    |
| Normal | `<leader>gt` | `:Gitsigns toggle_current_line_blame<CR>` | Toggle blame visibility when paused on a line |
| Normal | `<leader>gg` | `:LazyGit<CR>`                            | Open LazyGit inside Neovim                    |


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
for hex, 0o# for octal, etc)
| Mode   | Keybind      | Mapped To                | Notes                                           |
| :---   | :---         | :---                     | :---                                            |
| Normal | `<leader>cd` | `:<C-u>ConvDec<Space>`   | Convert the text after to decimal               |
| Normal | `<leader>ch` | `:<C-u>ConvHex<Space>`   | Convert the text after to hexadecimal           |
| Normal | `<leader>co` | `:<C-u>ConvOct<Space>`   | Convert the text after to octal                 |
| Normal | `<leader>cb` | `:<C-u>ConvBin<Space>`   | Convert the text after to binary                |
| Normal | `<leader>cs` | `:<C-u>ConvStr<Space>`   | Convert the text after to a string              |
| Normal | `<leader>ct` | `:<C-u>ConvBytes<Space>` | Convert the text after to a byte representation |

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


-----
-----
## Agile/ Jira/ Confluence
### Fibonacci info for Tasks/ Stories
| Points | Time equivalent |
| :----- | :-----          |
| 1      | 1 to 8 hrs      |
| 2      | 9 to 16 hrs     |
| 3      | 2 to 3 days     |
| 5      | 4 to 5 days     |  <- Most stories should not exceed this. If so, break them up.
| 8      | 6 to 7 days     |
| 13     | 8 to 10 days    |

### Acceptance criteria & definition of done
Definiition of done: same for all tasks/storys in a project
Acceptance criteria: unique to a task/story. Should be written is such a way that there is no 'partially done', it
either is or isn't.
