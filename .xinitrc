#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export LANG=ru_RU.UTF-8
export MM_CHARSET=UTF-8

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh) &
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
exec dbus-update-activation-environment --systemd DISPLAY &
export GNOME_KEYRING_CONTROL SSH_AUTH_SOCK GPG_AGENT_INFO GNOME_KEYRING_PID
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

#keychain ~/.ssh/id_ecdsa &
#[ -f ~/.keychain/$HOSTNAME-sh ] && . ~/.keychain/$HOSTNAME-sh 2>/dev/null &
#[ -f ~/.keychain/$HOSTNAME-sh-gpg ] && . ~/.keychain/$HOSTNAME-sh-gpg 2>/dev/null &
#eval $(ssh-agent) &

export GDK_CORE_DEVICE_EVENTS=1

#export G_FILENAME_ENCODING=@locale
#export G_BROKEN_FILENAMES=1

#export OOO_FORCE_DESKTOP=gnome
export GDK_USE_XFT=1

#export GTK_IM_MODULE="scim"
#export QT_IM_MODULE="scim"
#export XMODIFIERS="@im=SCIM"
#scim -d &amp;

#setxkbmap -layout "us,ru,ua" -option grp:alt_shift_toggle,grp_led:scroll,terminate:ctrl_alt_bksp,caps:hyper,compose:menu &
#setxkbmap -layout "us,ru" -option grp:alt_shift_toggle,grp_led:scroll,terminate:ctrl_alt_bksp,ctrl:nocaps,compose:menu &
#setxkbmap -layout "us,ru,jp" -option grp:alt_shift_toggle,grp_led:scroll,terminate:ctrl_alt_bksp,ctrl:nocaps,compose:menu &
#ibus-daemon -drx --panel /usr/lib/ibus/ibus-ui-gtk3 &

# iBus
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus

# UIM
#export GTK_IM_MODULE='uim'
#export QT_IM_MODULE='uim'
#uim-xim &
#export XMODIFIERS='@im=uim'
#uim-toolbar-gtk-systray &
#uim-toolbar-gtk3-systray &

#tint2 &
numlockx on &
#kbdd &
#sbxkb &
#fbxkb &
gnome-calendar &
xscreensaver -nosplash &
#compton -b &
picom -f --config ~/.config/picom/picom.conf &
#parcellite &
volumeicon &
#tilda &
caffeine &
#caffeine-indicator &
#pidgin &
#zoiper &
#geany &
#thunar --daemon &
#brave &
#pcmanfm -d &
#pcmanfm &
#nemo &
#lxterminal -e htop &
lxterminal -e yay &
#lxterminal -e pacaur -Syu &
#lxterminal -e sudo bauerbill -Syu --aur &
#lxterminal -e $XDG_CONFIG_HOME/opt/webchain-miner/webchain-miner &
#wine $HOME"/wine32/drive_c/Program Files/Microsoft Office/Office12/WINWORD.EXE" &
wine $HOME"/wine32/drive_c/Program Files/Microsoft Office/Office14/EXCEL.EXE" &
#pamac-tray &
#lxterminal &
#transmission-gtk &
#thunderbird &
#opera &
#skypeforlinux &
#doublecmd &
#smplayer &
#eclipse &
#telegram-desktop &
#icq &
#yandex-disk-indicator &
#nextcloud &
#mailru-cloud &
#env LD_LIBRARY_PATH=/opt/viber/lib viber &
#quiterss &
#flatpak run com.viber.Viber &
#virtualbox &
system-config-printer-applet &
#godoc -http=":6060" &
#gst123 /usr/share/sounds/freedesktop/stereo/service-login.oga &
#radiotray &
#gradio &
#xt7-player-mpv &
shortwave &
#udiskie -t &
#lxterminal -e curseradio &
#chromium &
#gnome-contacts &
#vivaldi-stable &
#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &

exec xmodmap ~/.xmodmap &
exec xsetroot -cursor_name left_ptr &
exec xset s off &
exec xset b off &
#exec xterm -geometry 80x66+0+0 -name login

#pantheon-files &
#gsettings-data-convert &
#xdg-user-dirs-gtk-update &
#/usr/lib/gnome-settings-daemon/gnome-settings-daemon &
#/usr/lib/gnome-user-share/gnome-user-share &

#exec cerbere
#evince $HOME'/Clouds/MailRuCloud/eBooks/Программирование/Lisp/ANSI Common Lisp.pdf' &
#chromium &

#emacs &
#emacs --eval "(setq server-name \"archevod\")" --daemon --with-x-toolkit=lucid &
#exec sbcl --load $XDG_CONFIG_HOME"/quicklisp/dists/quicklisp/software/clfswm-20161204-git/load.lisp
#exec gnome-session --session=awesome
#exec openbox-session
#exec cinnamon-session
#exec /usr/bin/startlxde
#exec /usr/bin/budgie-desktop
#exec xmonad
#exec xrdb .Xresources & i3

### Start BSPWM
$HOME/.config/polybar/launch.sh
#exec sxhkd &
exec bspwm

### Start StumpWM
#exec ssh-agent /usr/local/bin/stumpwm >> ~/stumpwm.log
#exec sbcl --eval '(ql:quickload "stumpwm")' --eval '(stumpwm:stumpwm)'
#exec sbcl --load $HOME/.local/bin/startstump >> $xlog 2>&1
#exec ros run --load $HOME/.local/bin/startstump >> $xlog 2>&1
#exec ssh-agent /usr/local/bin/stumpwm >> $HOME/.local/share/xorg/stumpwm.log 2>&1
#exec /usr/local/bin/stumpwm >> $HOME/.local/share/xorg/stumpwm.log 2>&1

# Start Awesome-WM
#exec awesome  >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr

#exec /usr/local/bin/stumpwm
#exec /usr/bin/spectrwm
#exec /usr/bin/nimdow
