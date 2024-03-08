#!/bin/bash

rootdir="/home/zx404f/git/"
session="lazygit"
itfiles="it-fileserver"
stg="stage-local"
stdrv="sys-test-driver"
tst="test-local"
demo="demo-local"
lwt1b="lwt1-black-local"
lwt1r="lwt1-red-local"
lwt2b="lwt2-black-local"
lwt2r="lwt2-red-local"

make_tmux_win() {
  tmux new-window -t "$session:$1" -n "$2"
}

start_lazygit() {
  tmux send-keys -t "$1" "cd $rootdir$1; lazygit" C-m
  echo "Starting lazygit in $1"
}

tmux new-session -d -s "$session";
tmux rename-window -t "$session":1 "$tst";
make_tmux_win 2 "$stg"
make_tmux_win 3 "$demo"
make_tmux_win 4 "$lwt1b"
make_tmux_win 5 "$lwt1r"
make_tmux_win 6 "$lwt2b"
make_tmux_win 7 "$lwt2r"
make_tmux_win 8 "$itfiles"
make_tmux_win 9 "$stdrv"
tmux send-keys -t "$tst"  'clear' C-m
start_lazygit "$tst"
start_lazygit "$stg"
start_lazygit "$demo"
start_lazygit "$lwt1b"
start_lazygit "$lwt1r"
start_lazygit "$lwt2b"
start_lazygit "$lwt2r"
start_lazygit "$itfiles"
start_lazygit "$stdrv"

tmux select-window -t "$tst"
#tmux attach-session -t "$session"
echo "Lazygit startup complete"
