#!/bin/bash

ssh_agent() {
        # Check for any ssh-agent process
        RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l`"
        echo $RUNNING_AGENT

        if [ $RUNNING_AGENT = 0 ]; then
        # Launch a new instance of the ssh-agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent
        fi
        eval `cat $HOME/.ssh/ssh-agent` > /dev/null
}

if [ -n "$SSH_AUTH_SOCK" ]; then
        ssh_agent
fi
