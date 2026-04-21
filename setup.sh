set -eux

source utils.sh

install_brew()

# install all homebrew packages (including stow)
brew bundle

# stow configuration files
stow --restow -d ~/dotfiles -t ~/.config config # stow config/ to ~/.config/
stow --restow -d ~/dotfiles -t ~ home # stow home/ to ~/
stow --restow -d ~/dotfiles -t ~/.local local # stow local/ to ~/.local/

# MacOS configuration stuff
defaults write com.apple.dock mru-spaces -bool false # avoid MacOS reordering desktops.
defaults write com.apple.Terminal FocusFollowsMouse -bool true # avoid having to click once to focus on a window
defaults write com.apple.dock autohide -bool true # automatically hide dock.
defaults write com.apple.dock autohide-time-modifier -float 0.30 # increase animation speed of dock appearing
defaults write com.apple.dock autohide-delay -float 0 # immediately show dock when moving cursor to the bottom.

enable_disk_encryption()

remove_app("iMovie")
remove_app("GarageBand")

killall Dock # MacOS should restart this immediately by itself.
