ln -sf ~/dev/src/github.com/komapotter/dotfiles ~/dev/misc/dotfiles
ln -sf ./dev/misc/dotfiles/.bash_logout  ~/.bash_logout
ln -sf ./dev/misc/dotfiles/.bash_profile ~/.bash_profile
ln -sf ./dev/misc/dotfiles/.bashrc       ~/.bashrc
ln -sf ./dev/misc/dotfiles/.gitconfig    ~/.gitconfig
ln -sf ./dev/misc/dotfiles/.screenrc     ~/.screenrc
ln -sf ./dev/misc/dotfiles/.vimrc        ~/.vimrc
ln -sf ./dev/misc/dotfiles/.zshrc        ~/.zshrc
mkdir ~/bin && ln -sf ~/dev/misc/dotfiles/misc/pero     ~/bin/pero
mkdir -p ~/.zsh/completion
ln -s /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion ~/.zsh/completion/_docker
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion ~/.zsh/completion/_docker-compose
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.zsh-completion ~/.zsh/completion/_docker-machine
