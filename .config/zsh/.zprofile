#=-[ENV VARS]-=#
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export EDITOR=nvim
export MOZ_WEBRENDER=1
export LIBVA_DRIVER_NAME=i965
export MOZ_DISABLE_RDD_SANDBOX=1
export QT_QPA_PLATFORMTHEME=gtk2
export PATH=$HOME/.local/bin:$PATH
export TMUX_TMPDIR=$XDG_STATE_HOME
export MANPAGER="nvim -c 'Man!' -o -"
export TERMINFO=$XDG_DATA_HOME/terminfo
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc

#=-[AUTOLOGIN]-=#
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx "$XDG_CONFIG_HOME/X11/xinitrc" &> /dev/null
fi
