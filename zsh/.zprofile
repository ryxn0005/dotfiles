#
# ~/.zprofile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc

if [ -z "${WAYLAND_DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
  export PATH=$(echo "$PATH" | tr ':' '\n' | grep -v anaconda | tr '\n' ':')
  export XDG_CURRENT_DESKTOP=wlroots
  export XDG_SESSION_TYPE=wayland
  export XDG_SESSION_DESKTOP=wlroots
  exec dbus-run-session --config-file=/usr/share/dbus-1/session.conf sh -c "slstatus -s | dwl -s $HOME/.local/bin/dwl-startup"
fi
