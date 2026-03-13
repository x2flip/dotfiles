# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

# zinit
source ~/.local/share/zinit/zinit.git/zinit.zsh

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gbaudino/.zshrc'

eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# --- RDP over SSH (Wayland + NVIDIA) ---
# Prefer SDL client on Wayland; fall back to xfreerdp3
RDP_CLIENT=$(command -v sdl-freerdp3 || command -v xfreerdp3)

# NVIDIA render offload + VAAPI (NVDEC) for decode
RDP_NVIDIA_ENV='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only LIBVA_DRIVER_NAME=nvidia'

# Map of hosts → local ports
typeset -A RDP_PORTS=( [AET-0077]=4444 )

rdp() {
  local host=${1:-AET-0077}
  local port=${RDP_PORTS[$host]:-4444}
  shift || true
  # ensure the SSH tunnel is up
  ss -ltn | grep -q ":${port} " || ssh -fNT aet0077-tunnel
  # launch FreeRDP with NVIDIA offload + HW decode
  eval $RDP_NVIDIA_ENV "$RDP_CLIENT" /t:"${host}" /v:127.0.0.1:${port} \
    /u:ASCENTEC\\Gbaudino /dynamic-resolution /auto-reconnect /sec:nla /cert:ignore /gfx-h264 "$@"
}

rdp-stop() { ssh -O exit aet0077-tunnel 2>/dev/null || pkill -f 'ssh.*127\.0\.0\.1:4444' 2>/dev/null || true; }
# --- end RDP block ---

export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim

# bun completions
[ -s "/home/gbaudino/.bun/_bun" ] && source "/home/gbaudino/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export WALLPAPER_DIR="$HOME/Pictures/wallpapers"

export LD_LIBRARY_PATH="$HOME/.local/lib:$HOME/.local/lib64:${LD_LIBRARY_PATH:-}"



### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# opencode
export PATH=/home/gbaudino/.opencode/bin:$PATH
