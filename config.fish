# Installation notes for future me:
#   - brew install fish
#   - add it to /etc/shells
#   - sudo chsh
#   - ln -s ~/code/dotfiles/config.sh ~/.config/fish/config.fish
#   - install fisher: https://github.com/jorgebucaran/fisher
#   - fisher install jorgebucaran/nvm.fish
#   - fisher install IlanCosman/tide@v6
#   - tide configure

if status is-interactive
    fish_add_path /opt/homebrew/bin
    fish_add_path ~/.yarn/bin

    if test -f /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
        source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
    end

    set -gx EDITOR nvim
    set -gx DOCKER_DEFAULT_PLATFORM linux/amd64

    set -U tide_right_prompt_items \
        status cmd_duration context jobs node virtual_env go toolbox time

    abbr --add e 'nvim'
    abbr --add g 'git'
    abbr --add k 'kubectl'

    if test -f "$(dirname (status --current-filename))/config.local.fish"
        source "$(dirname (status --current-filename))/config.local.fish"
    end
end
