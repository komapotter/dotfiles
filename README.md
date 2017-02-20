
```
cd ~ && mkdir Development
git clone https://github.com/komapotter/dotfiles.git ./Development/dotfiles
sh ./Development/dotfiles/attach.sh
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/neobundle.vim.git
vim
:NeoBundleInstall
:GoUpdateBinaries
gocode set autobuild true
```

