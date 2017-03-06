ln -sf ./dev/dotfiles/.bash_logout  ~/.bash_logout
ln -sf ./dev/dotfiles/.bash_profile ~/.bash_profile
ln -sf ./dev/dotfiles/.bashrc       ~/.bashrc
ln -sf ./dev/dotfiles/.gitconfig    ~/.gitconfig
ln -sf ./dev/dotfiles/.screenrc     ~/.screenrc
ln -sf ./dev/dotfiles/.vimrc        ~/.vimrc
ln -sf ./dev/dotfiles/.zshrc        ~/.zshrc
mkdir ~/bin && ln -sf ./dev/dotfiles/misc/pero     ~/bin/pero
mkdir -p ~/.zsh/completion
curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/zsh/_docker > ~/.zsh/completion/_docker
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose
curl -L https://raw.githubusercontent.com/docker/machine/v$(docker-machine --version | tr -ds ',' ' ' | awk 'NR==1{print $(3)}')/contrib/completion/zsh/_docker-machine > ~/.zsh/completion/_docker-machine ')
