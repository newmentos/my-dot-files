#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#alias luarocks='luarocks-5.1 --from=https://raw.githubusercontent.com/torch/rocks/master/'
alias youtube-dl='youtube-dl --external-downloader aria2c --external-downloader-args "-c -j 3 -x 3 -s 3 -k 1M"'
PS1='[\u@\h \W]\$ '

#export EDITOR="geany"
export EDITOR="emacsclient"
export ALTERNATE_EDITOR="geany"
export TEXTEDIT="emacsclient +%d %s"
#export BROWSER="opera"
#export BROWSER="brave"
export BROWSER="nyxt"
#export BROWSER="conkeror"
#export VISUAL="geany"
export VISUAL="emacsclient"
#export VISUAL="vim"
#export VISUAL="mcedit"

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DOWNLOAD_DIR=$HOME/Downloads

#export SBCL_HOME=$HOME/.asdf/installs/sbcl/2.0.7/lib/sbcl
#export SBCL_HOME=/usr/lib/sbcl
#export SBCL_HOME=$HOME/.roswell/impls/x86-64/linux/sbcl-bin/2.0.7/lib/sbcl

# Go lang settings
#export GOROOT=$HOME/.gvm/gos/go1.8
#export GOPATH=$HOME/.gvm/pkgsets/go1.8/global
#export GOROOT=/usr/lib/go
#export GOPATH=$HOME/go
#export GOROOT_BOOTSTRAP=$HOME/.gvm/gos/go1.4
#export GOHOSTOS=linux
#export GOHOSTARCH=amd64
#export GOOS=linux
#export GOARCH=amd64
#export CC=gcc
#export GOBIN=
#export GODEBUG=cgocheck=0
#export CGO_ENABLED=1
#export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
#export PROMPT_COMMAND="echo -n [$(date +%H%M)]"

alias msfconsole="msfconsole --quiet -x \"db_connect msf@msf\""

# LUA settings
#export LUA=/usr/include/lua5.3
#export LUAINC=/usr/include/lua5.3
#export LUALIB=/usr/lib/lua/5.3
#export LUABIN=/usr/bin
#export TORCH_LUA_VERSION=LUA51

export OpenCV_DIR=/usr/share/opencv

export PATH=/usr/bin:/sbin
export PATH=~/.local/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH

#export PATH=~/.nimble/bin:$PATH

#export PATH=$PATH:/opt/cuba-studio/bin:/opt/gwt/bin:/opt/openresty/bin:/opt/openresty/nginx/sbin
#export PATH=$PATH:$HOME/node_modules/.bin
#export PATH=$PATH:/opt/anaconda/bin
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig
#export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_LIBDIR=$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib
# for start Viber
#export LD_LIBRARY_PATH=/opt/viber/lib:$LD_LIBRARY_PATH
#export QT_QPA_PLATFORMTHEME=qgnomeplatform

# [[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# [ -s $HOME/.luaver/luaver ] && . $HOME/.luaver/luaver

#export ROSWELL_HOME=$HOME/.roswell
#export PATH=$ROSWELL_HOME/bin:$PATH
#export PATH=$ROSWELL_HOME/impls/x86-64/linux/sbcl-bin/2.0.7/bin:$PATH
#export PATH=$HOME/projects/bin:$PATH

#export PATH=$HOME/.emacs.d/.cask/bin:$PATH
#export PATH="$HOME/.cask/bin:$PATH"

#export VBOX_USB=usbfs


eval "$(stack --bash-completion-script stack)"

#function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

#PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

export SUDO_ASKPASS=ssh-askpass

# CHICKEN settings
# export CHICKEN_DOC_REPOSITORY=~/chickens/5.1.0/share/chicken/chicken-doc
# export CHICKEN_INSTALL_REPOSITORY=~/eggs/lib/chicken/11
# export CHICKEN_REPOSITORY_PATH=~/eggs/lib/chicken/11
# export CHICKEN_DOC_COLORS=auto
# export LD_LIBRARY_PATH=~/chickens/5.1.0/lib:$CHICKEN_REPOSITORY_PATH:$LD_LIBRARY_PATH
# export PATH=$PATH:~/chickens/5.1.0/bin:$CHICKEN_REPOSITORY_PATH
# export CSC_OPTIONS='-I/usr/lib/libffi-3.2.1/include/ -I/usr/include/im/ -I/usr/include/iup/'
# export CSC_OPTIONS='-I/usr/include/glib-1.2/ -I/usr/include/im/ -I/usr/include/iup/'

#export WINEARCH=win64
#export WINEPREFIX="$HOME/wine64"
export WINEARCH=win32
export WINEPREFIX="$HOME/wine32"
#export WINEPREFIX="$HOME/msoffice"


#export GTK_PATH=/usr/lib/gtk-2.0:/usr/lib/gtk-3.0

export CC=/usr/bin/gcc
export JAVA_HOME=/usr/lib/jvm/java-8-jdk
export JDK_HOME={JAVA_HOME}
export ANDROID_HOME=/opt/android-sdk
export KAWA_HOME=$HOME/src/Kawa
export NDK_PROJECT_PATH=$HOME/projects/android
export ANDROID_PLATFORM=android-16
export PATH=$PATH:$JAVA_HOME/bin:$KAWA_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#fahstat() {
#        echo
#        echo $(date)
#        echo
#        cat /opt/fah/newmentos/unitinfo.txt
#}

# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

