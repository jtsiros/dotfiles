# prompt settings
set -g theme_color_scheme chain
set -g theme_display_date no
set -g theme_display_cmd_duration no

# homebrew asdf installation
if test -f /usr/local/opt/asdf/asdf.fish
    source /usr/local/opt/asdf/asdf.fish
end

set GO (which go)
set -gx GOPATH $HOME/dev/go

set -gx LESS '-F -g -i -M -R -S -w -X -z-4'
set -gx BROWSER open
set -gx EDITOR emacsclient
set -gx VISUAL emacsclient
set -gx PAGER less
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.utf-8
set -gx LC_ALL en_US.UTF-8
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --skip-vcs-ignores --ignore .git --ignore vendor --ignore node_modules -g ""'
set -gx LSCOLORS 'Exfxcxdxbxegedabagacad'

# Set PATH so it includes user's private bin directories (if they exist)
if test -d "$HOME/.local/bin"; set PATH "$HOME/.local/bin" $PATH; end
if test -d "$HOME/.emacs.d/bin"; set PATH "$HOME/.emacs.d/bin" $PATH; end
if test -d "$GOPATH/bin"; set PATH "$GOPATH/bin" $PATH; end
if test -d "/snap/bin"; set PATH "/snap/bin" $PATH; end
if test -d "$GO/bin"; set PATH "$GO/bin" $PATH; end
if test -d "$HOME/.cabal/bin"; set PATH "$HOME/.cabal/bin" $PATH; end

# Disable the fish greeting
set fish_greeting ""

# Enable direnv (https://direnv.net/)
eval (direnv hook fish)

# Configure Rust environment
if test -f "$HOME/.cargo/env"; eval (source $HOME/.cargo/env); end

# Local config
if test -f ~/.config/fish/config_local.fish
	source ~/.config/fish/config_local.fish
end
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
