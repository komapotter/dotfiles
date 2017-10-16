
```
cd ~ && mkdir -p dev/misc
git clone https://github.com/komapotter/dotfiles.git ./dev/misc/dotfiles
sh ./dev/misc/dotfiles/attach.sh
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/neobundle.vim.git
vim
:call dein#update()
:GoUpdateBinaries
gocode set autobuild true
gocode set unimported-packages true
```

