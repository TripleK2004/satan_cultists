#=-[ENV VARS]-=#
export MOZ_X11_EGL=1
export MOZ_WEBRENDER=1
export MOZ_ENABLE_WAYLAND=1
export MOZ_DISABLE_RDD_SANDBOX=1

export XDG_CURRENT_DESKTOP=Unity
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority

export PATH=$HOME/.local/bin:$PATH
export TERMINFO=$XDG_DATA_HOME/terminfo
export LD_LIBRARY_PATH="$HOME"/.local/lib

export EDITOR=nvim
export LIBVA_DRIVER_NAME=i965
export QT_QPA_PLATFORMTHEME=qt5ct
export TMUX_TMPDIR=$XDG_STATE_HOME
export MANPAGER="nvim -c 'Man!' -o -"
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
