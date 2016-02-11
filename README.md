# Bootstrapping

```
cd ~
git clone git@github.com:GregMefford/dotfiles.git
```

## Set up Vim

```
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
