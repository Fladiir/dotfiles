#!/bin/bash


i3-msg "workspace 5; append_layout ~/.i3/workspace-5.json"

(termite -t vim -e 'vim -c NERDTreeToggle' &)
(termite -t console -d ~/Projects &)
