function spawn_agent() {
    echo "Spawning new ssh-agent..."
    eval $(ssh-agent -s | tee ~/.ssh/agent.txt)
}

if [[ -f ~/.ssh/agent.txt ]]; then
    source ~/.ssh/agent.txt > /dev/null
    if kill -0 ${SSH_AGENT_PID} &> /dev/null; then
        echo "Agent pid ${SSH_AGENT_PID}"
    else
        echo "Agent down. Deleting file."
        rm -f ~/.ssh/agent.txt
        spawn_agent
    fi
else
    spawn_agent
fi
