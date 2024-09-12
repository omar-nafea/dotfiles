alias I='yay -S'
alias bash='~/.bashrc'
alias blue='bluetoothctl'
alias cls='clear'
alias edit-in-kitty='kitten edit-in-kitty'
alias grep='grep --color=auto'
alias i='sudo pacman -S'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -l'
alias ls='ls --color=auto'
alias net='nmtui'
alias q='sudo pacman -Q'
alias r='sudo pacman -R'
alias su='sudo'
alias u='sudo pacman -Syu'
alias ug='sudo pacman -U'
alias vi='nvim'
alias yy='yt-dlp'
alias size='du -sh --block-size=MB'
alias batt='cat /sys/class/power_supply/BAT0/capacity'
alias s='sudo pacman -Ss'
alias restartblue='sudo systemctl restart bluetooth
sudo rfkill unblock bluetooth'
# Function to set prompt
set_prompt() {
  if [[ "$PWD" == "$HOME" ]]; then
    PS1='\[\033[1;32m\]~>\[\033[0m\]\[\033[1;34m\]\w\[\033[0m\] '
  elif [[ "$PWD" == "/" ]]; then
    PS1='\[\033[1;32m\]/>\[\033[0m\]\[\033[1;34m\]\w\[\033[0m\] '
  else
    PS1='\[\033[1;32m\]>\[\033[0m\]\[\033[1;34m\]\w\[\033[0m\] '
  fi
}

export PATH=$PATH:/path/to/lua-language-server
# Call the function to set prompt
PROMPT_COMMAND=set_prompt

export GTK_THEME=Adwaita:dark
export PATH="$HOME/.local/bin:$PATH"

