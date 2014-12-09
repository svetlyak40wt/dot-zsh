#! /bin/zsh


autoload -U compinit zrecompile

zsh_cache=${HOME}/.zsh-cache
mkdir -p $zsh_cache

if [ $UID -eq 0 ]; then
    compinit
else
    compinit -d $zsh_cache/zcomp-$HOST

    for f in ~/.zshrc $zsh_cache/zcomp-$HOST; do
        zrecompile -p $f && rm -f $f.zwc.old
    done
fi


setopt extended_glob
for zshrc_config in ~/.zsh/*[^~] ; do
    source $zshrc_config
done

bindkey -e


test -f ~/.zshrc_local && source ~/.zshrc_local

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
