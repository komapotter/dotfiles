
```
cd ~ && mkdir -p dev/misc
git clone https://github.com/komapotter/dotfiles.git ./dev/misc/dotfiles
sh ./dev/dotfiles/attach.sh
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/neobundle.vim.git
vim
:NeoBundleInstall
:GoUpdateBinaries
gocode set autobuild true
```

