if status is-interactive

end

# ATAJOS
# brillo y saturacion
alias 1="xgamma -gamma 0.8 && xrandr --output eDP --brightness 1.2"
# neovim
alias vi="nvim"

# eliminar
alias cl="clear"

# salir
alias q="exit"

# archivos
alias ls="exa --icons"
alias ll="exa --icons --header --long --git"
alias tree="exa --icons --tree"

# Python
alias py="python"

#git
alias gcl="git clone --depth 1"
alias gi="git init"
alias ga="git add"
alias gs= "git status"
alias gc="git commit -m"
alias gp= "git push origin -u master"

# Pacman
alias spi= "sudo pacman -S"
alias spu= "sudo pacman -Syyu"

# Sonidos de teclado
alias ru='cd ~/Escritorio/Soundpacks/Soundpacks/ && rustyvibes eg-crystal-purple  -v 300'
alias ru2='cd ~/Escritorio/Soundpacks/Soundpacks/ && rustyvibes eg-oreo  -v 250'

#mi music
alias m5='/usr/bin/mplayer /home/favio/Music/CodeLunes.mp3'
alias m2='/usr/bin/mplayer /home/favio/Music/CodeMartes.mp3'
alias m3='/usr/bin/mplayer /home/favio/Music/CodeMiercoles.mp3'
alias m4='/usr/bin/mplayer /home/favio/Music/CodeJueves.mp3'
alias m1='/usr/bin/mplayer /home/favio/Music/CodePython.mp3'
alias m0='/usr/bin/mplayer /home/favio/Music/Code.mp3'
alias l1='/usr/bin/mplayer /home/favio/Music/luis-miguiel.mp4'

# Tmux
alias tks='tmux kill-session'
alias tk='tmux kill-session -a'
alias tns='tmux new-session'
alias tls='tmux list-session'


export PATH="$HOME/.cargo/bin:$PATH"


# export PATH=$PATH:~/.local/bin
# export PATH=$PATH:~/.cargo/bin

set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
set fish_greeting
