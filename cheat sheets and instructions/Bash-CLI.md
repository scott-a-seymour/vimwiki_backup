
# Bash/ Terminal
## General
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

## kubectl
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


## git
| Alias       | What It Does                           |
| :---        | :---                                   |
| `branch`    | `git branch `                          |
| `co`        | `git checkout `                        |
| `log`       | `remote_up; git log --oneline --graph` |
| `remote`    | `git remote`                           |
| `remote_up` | `git remote update`                    |
| `status`    | `git status`                           |

## Tmux
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


