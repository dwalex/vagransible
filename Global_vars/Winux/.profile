# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# ssh socket and ssh-agent
if [ -z "$SSH_AUTH_SOCK" ]; then
        # Check for a currently running instance of the agent
        RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l`"
        if [ $RUNNING_AGENT = 0 ]; then
                # Launch a new instance of the agent
                ssh-agent -s &> $HOME/.ssh/ssh-agent
        fi
        eval `cat $HOME/.ssh/ssh-agent` > /dev/null
fi

export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS=1
export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
export PATH="$PATH:/mnt/c/Windows/System32/cmd.exe"
export VAGRANT_DIR="$HOME/vagransible"
export ANSIBLE_DIR="$VAGRANT_DIR/.ansible"
export ANSIBLE_PLAYBOOKS="$ANSIBLE_DIR/playbooks"
export ANSIBLE_CONFIG_DIR="/etc/ansible"
export ANSIBLE_CONFIG="$ANSIBLE_CONFIG_DIR/ansible.cfg"
export DEFAULT_HOST_LIST="$ANSIBLE_CONFIG_DIR/hosts"

if grep -E '# Vagransible' /etc/hosts > /dev/null; then echo > /dev/null; else cat $HOME/vagransible/Global_vars/Winux/hosts | sudo tee -a /etc/hosts 1>/dev/null; fi
