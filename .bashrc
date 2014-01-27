if [ -z "$RUN_BASH" ]; then
    if [ -x /bin/zsh ];then
        exec /bin/zsh
    else
        test -x /usr/bin/zsh && exec /usr/bin/zsh
    fi
fi
