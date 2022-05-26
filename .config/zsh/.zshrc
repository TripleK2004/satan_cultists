#=-[INTERACTIVE SHELL CHECK]-=#
[[ $- != *i* ]] && return

#=-[HISTORY MANAGEMENT]-=#
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt HIST_SAVE_NO_DUPS
HISTFILE=$XDG_DATA_HOME/zsh/history

#=-[TAB COMPLETE]-=#
setopt autocd
autoload compinit
autoload bashcompinit
zstyle ':completion:*' menu select cache-path \
				    $XDG_DATA_HOME/zsh/zcompcache
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
				    'r:|[._-]=* r:|=*' \
				    'l:|=* r:|=*'
zmodload zsh/complist
compinit -d $XDG_DATA_HOME/zsh/zcompdump
_comp_options+=(globdots)

#=-[ALIASES]-=#
alias \
      ll='exa -lah' \

alias \
      pkgr='sudo apt remove' \
      pkgi='sudo apt install' \
      pkgup='sudo apt update' \
      pkgug='sudo apt upgrade'

alias \
      ga='git add' \
      gl='git log' \
      gd='git diff' \
      gp='git push' \
      gc='git clone' \
      gs='git status' \
      gcm='git commit -m'

#=-[FUNCTIONS]-=#
pkgs()
{
  apt search "$1" \
  | sed -nE '/testing/s/(.*)\/(.*)/\1/p' \
  | less
}

pkgfs()
{
  apt-file search "$1" \
  | sed -nE 's/([a-z-]*):(.*)/\1/p' \
  | uniq \
  | less
}

rnamewall()
{
  for file in $(ls ~/MEGA/wallhaven \
    | egrep -v '^.{6}\.jpg$')
  do
    cd ~/MEGA/wallhaven
    mv -v "$file" $(tr -dc a-z0-9 < /dev/urandom \
		    | head -c 6; echo '').jpg
    cd - > /dev/null
  done
}

slbuild()
{
  make install; rm *.o
  find ./ -type f -executable -exec rm {} \;
}

stove()
{
  cd ~/.git-repos/satan_cultists
  stow .; cd - > /dev/null
}

yt()
{
  choice=$(ytfzf -tL "$1")
  yt-dlp -f 247+251 "$choice"
}

#=-[ZSH PLUGINS]-=#
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.local/share/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.local/share/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

#=-[KEYBINDS]-=#
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

eval "$(starship init zsh)"
