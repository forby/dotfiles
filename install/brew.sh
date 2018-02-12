if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap Goles/battery
brew tap homebrew/php
brew update
brew upgrade

# Install packages

apps=(
  bash-completion2
  bats
  battery
  coreutils
  composer
  diff-so-fancy
  dockutil
  ffmpeg
  fasd
  gifsicle
  git
  git-extras
  gnu-sed --with-default-names
  grep --with-default-names
  hub
  httpie
  imagemagick
  jpegoptim
  jq
  lynx
  mackup
  mysql
  nano
  pandoc
  peco
  php71
  php71-mcrypt
  php71-imagick
  psgrep
  python
  shellcheck
  ssh-copy-id
  tree
  unar
  wget
  yarn
)

brew install "${apps[@]}"

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"

ln -sfv "$DOTFILES_DIR/etc/mackup/.mackup.cfg" ~
