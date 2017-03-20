#!/bin/bash

#Appending saved layout to workspace M
i3-msg "workspace 1; append_layout ~/.i3/workspace-1.json"

# And finally we fill the containers with the programs they had
#(termite &)
#(termite &)
(termite &)
(termite &)
(termite -t htop -e 'htop' &)
(termite -t mpsyt -e 'mpsyt' &)
