# Adding a plugin manager (vim-plug)

You can add plugins to Vim to add extra functionality. Most people use a plugin manager to make plugin installation easy.

There are a variety of plugin managers we can use. I will show you how to install and use the  <ins>vim-plug</ins>  plugin manager.

To install the vim-plug plugin, run this command:

On Linux or Mac OS.

```bash
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

On Windows with Powershell.

```powershell
$ iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force 
```

Add the  `call plug#begin('~/.vim/plugged')`  and  `call plug#end()`  lines in the plugins section. The plugins we install will be added between the two function calls.

```
" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')




call plug#end()

" }}} 
```

Now installing plugins is as easy as adding the  `Plug 'username/plugin-name'`  string you find on GitHub in between the function calls.