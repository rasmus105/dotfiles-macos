set -eux

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install all homebrew packages (including stow)
brew bundle

# stow configuration files
stow --restow -d ~/dotfiles -t ~/.config config # stow config/
stow --restow -d ~/dotfiles -t ~ home # stow home/
