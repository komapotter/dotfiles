ln -sf ./dev/misc/dotfiles/.bash_logout  ~/.bash_logout
ln -sf ./dev/misc/dotfiles/.bash_profile ~/.bash_profile
ln -sf ./dev/misc/dotfiles/.bashrc       ~/.bashrc
ln -sf ./dev/misc/dotfiles/.gitconfig    ~/.gitconfig
ln -sf ./dev/misc/dotfiles/.screenrc     ~/.screenrc
ln -sf ./dev/misc/dotfiles/.vimrc        ~/.vimrc
ln -sf ./dev/misc/dotfiles/.zshrc        ~/.zshrc
mkdir ~/bin && ln -sf ~/dev/misc/dotfiles/misc/pero     ~/bin/pero
mkdir -p ~/.zsh/completion
curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/zsh/_docker > ~/.zsh/completion/_docker
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose
curl -L https://raw.githubusercontent.com/docker/machine/v$(docker-machine --version | tr -ds ',' ' ' | awk 'NR==1{print $(3)}')/contrib/completion/zsh/_docker-machine > ~/.zsh/completion/_docker-machine ')
