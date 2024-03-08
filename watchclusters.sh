#!/bin/bash

session="watcher"
tst="Test_cluster"
stg="Stage_cluster"
dmo="Demo_cluster"
lwt1="LWT1_cluster"
lwt2="LWT2_cluster"

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

k_nspc="kms"
m_nspc="mms-mpo"
n_nspc="nms"
k_fnspc="$k_nspc-flux"
m_fnspc="$m_nspc-flux"
n_fnspc="$n_nspc-flux"
numwins=3

make_tmux_panes() {
  tmux split-window -t "$1" -v -p 50
  tmux split-window -t "$1" -h -p 33
  tmux select-pane -t 2
  tmux split-window -t "$1" -h -p 50
  tmux select-pane -t 1
  tmux split-window -t "$1" -h -p 33
  tmux select-pane -t 1
  tmux split-window -t "$1" -h -p 50
}

start_k9s() {
  tmux select-pane -t "$1"
  tmux send-keys "k_context $2; k9s --cluster $2  --namespace $3" C-m
  echo "Starting k9s in $2, $3"
  sleep 5
}

start_test() {
  tmux rename-window -t "$session":1 "$tst";
  echo "Starting test in window 1"
  make_tmux_panes "$tst"
  # test has the -flux namespaces, so we use those variables
  start_k9s 1 "$btst" "$k_fnspc"
  start_k9s 2 "$btst" "$m_fnspc"
  start_k9s 3 "$btst" "$n_fnspc"
  start_k9s 4 "$rtst" "$k_fnspc"
  start_k9s 5 "$rtst" "$m_fnspc"
  start_k9s 6 "$rtst" "$n_fnspc"
}

start_stage() {
  echo "Starting stage in window 2"
  tmux new-window -t "$session":2 -n "$stg";
  make_tmux_panes "$stg"
  start_k9s 1 "$bstg" "$k_nspc"
  start_k9s 2 "$bstg" "$m_nspc"
  start_k9s 3 "$bstg" "$n_nspc"
  start_k9s 4 "$rstg" "$k_nspc"
  start_k9s 5 "$rstg" "$m_nspc"
  start_k9s 6 "$rstg" "$n_nspc"
}

start_demo() {
  echo "Starting demo in window $1"
  tmux new-window -t "$session":$1 -n "$dmo"
  make_tmux_panes "$dmo"
  start_k9s 1 "$bdmo" "$k_nspc"
  start_k9s 2 "$bdmo" "$m_nspc"
  start_k9s 3 "$bdmo" "$n_nspc"
  start_k9s 4 "$rdmo" "$k_nspc"
  start_k9s 5 "$rdmo" "$m_nspc"
  start_k9s 6 "$rdmo" "$n_nspc"
}

start_lwt1() {
  echo "Starting lwt-1 in window $1"
  tmux  new-window -t "$session":$1 -n "$lwt1"
  make_tmux_panes "$lwt1"
  start_k9s 1 "$blw1" "$k_nspc"
  start_k9s 2 "$blw1" "$m_nspc"
  start_k9s 3 "$blw1" "$n_nspc"
  start_k9s 4 "$rlw1" "$k_nspc"
  start_k9s 5 "$rlw1" "$m_nspc"
  start_k9s 6 "$rlw1" "$n_nspc"
}

start_lwt2() {
  echo "Starting lwt-2 in window $1"
  tmux  new-window -t "$session":$1 -n "$lwt2"
  make_tmux_panes "$lwt2"
  start_k9s 1 "$blw2" "$k_nspc"
  start_k9s 2 "$blw2" "$m_nspc"
  start_k9s 3 "$blw2" "$n_nspc"
  start_k9s 4 "$rlw2" "$k_nspc"
  start_k9s 5 "$rlw2" "$m_nspc"
  start_k9s 6 "$rlw2" "$n_nspc"
}

################################################################################
# Each window has a cluster. 6 panes are created to display a k9s instance in
# each one. Red/ black with kms, mms-mpo, and nms.
tmux new-session -d -s "$session";
# First window is the test cluster
start_test
# Second window is stage
start_stage
# Third and subsequent are optional, and need the window number passed in

while getopts d:l:L flag
do
  case "$flag" in
    d) start_demo "$numwins";
      numwins=$(($numwins+1));;
    l) start_lwt1 "$numwins";
      numwins=$(($numwins+1));;
    L) start_lwt2 "$numwins";
      numwins=$(($numwins+1));;
  esac
done

# Wrap it up
tmux select-window -t "$tst"
#tmux attach-session -t "$session"
echo "K9s watcher startup complete"
