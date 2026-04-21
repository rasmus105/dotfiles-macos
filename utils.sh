function install_brew() {
    if [ ! -r "/opt/homebrew" ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif ! [ -x "$(command -v brew)" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
}
function enable_disk_encryption() {
    if [ "$(fdesetup isactive)" = "false" ]; then
        sudo fdesetup enable "$(id -un)"
    fi
}
function remove_app() {
    if [ -r "/Applications/$1.app" ]; then
        rm -rf /Applications/$1.app
    fi
}
