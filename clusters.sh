#!/bin/bash

session="k9s"
tname="terminal"
btst="black-tst"
bstg="black-stg"
bdmo="black-demo"
blw1="black-lwt1"
blw2="black-lwt2"
rtst="red-tst"
rstg="red-stg"
rdmo="red-demo"
rlw1="red-lwt1"
rlw2="red-lwt2"
nspc="mms-mpo"
fnspc="$nspc-flux"
numwins=5

make_tmux_win() {
  tmux new-window -t "$session:$1" -n "$2"
  sleep 1
}

start_k9s() {
  tmux send-keys -t "$1" "k_context $1; k9s --cluster $1 --namespace $2" C-m
  echo "Starting k9s in $1"
  sleep 5
}

tmux new-session -d -s "$session";
tmux rename-window -t "$session":1 "$btst";
make_tmux_win 2 "$rtst";
make_tmux_win 3 "$bstg";
make_tmux_win 4 "$rstg";
start_k9s "$btst" "$fnspc";
start_k9s "$rtst" "$fnspc";
start_k9s "$bstg" "$nspc";
start_k9s "$rstg" "$nspc";

while getopts d:l:L flag
do
  bwin=$numwins
  numwins=$(($numwins+1))
  rwin=$numwins
  numwins=$(($numwins+1))
  case "$flag" in
    d) make_tmux_win "$bwin" "$bdmo";
      make_tmux_win "$rwin" "$rdmo";
      start_k9s "$bdmo" "$nspc";
      start_k9s "$rdmo" "$nspc";;
    l) make_tmux_win "$bwin" "$blw1";
      make_tmux_win "$rwin" "$rlw1";
      start_k9s "$blw1" "$nspc";
      start_k9s "$rlw1" "$nspc";;
    L) make_tmux_win "$bwin" "$blw2";
      make_tmux_win "$rwin" "$rlw2";
      start_k9s "$blw2" "$nspc";
      start_k9s "$rlw2" "$nspc";;
  esac
done

tmux select-window -t "$btst"
#tmux attach-session -t "$session"
echo "K9s startup complete"
