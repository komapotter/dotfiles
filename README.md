
```
cd ~ && mkdir -p dev/misc
git clone https://github.com/komapotter/dotfiles.git ./dev/misc/dotfiles
sh ./dev/misc/dotfiles/attach.sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
vim
:call dein#update()
:GoUpdateBinaries
```
