#!/bin/sh
tmux new-session -s 'prompt'
tmux new-window -n w2
tmux splitw -h -p 35
