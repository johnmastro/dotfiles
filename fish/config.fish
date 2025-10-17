# Installation notes for future me:
#   - brew install fish
#   - add it to /etc/shells
#   - sudo chsh
#   - ln -s ~/code/dotfiles/fish/config.fish ~/.config/fish/config.fish
#   - install fisher: https://github.com/jorgebucaran/fisher
#   - fisher install jorgebucaran/nvm.fish
#   - fisher install IlanCosman/tide@v6
#   - tide configure

if status is-interactive
    fish_add_path /opt/homebrew/bin

    set -gx EDITOR nvim

    abbr --add e nvim
    abbr --add g git
    abbr --add k kubectl

    if test -f "$(dirname (status --current-filename))/config.local.fish"
        source "$(dirname (status --current-filename))/config.local.fish"
    end
end
