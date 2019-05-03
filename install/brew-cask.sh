if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap caskroom/versions
brew tap caskroom/cask
brew tap caskroom/fonts

# Install packages

apps=(
  appcleaner
  keepingyouawake
  dropbox
  firefox
  fontbase
  font-fira-code
  github
  google-chrome
  hammerspoon
  iterm2
  macdown
  sequel-pro
  sketch
  slack
  sourcetree
  spectacle
  spotify
  transmit4
  virtualbox
  visual-studio-code
  vlc
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package qlvideo

# Link Hammerspoon config
if [ ! -d ~/.hammerspoon ]; then ln -sfv "$DOTFILES_DIR/etc/hammerspoon/" ~/.hammerspoon; fi
