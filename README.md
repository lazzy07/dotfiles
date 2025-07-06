# This is my custom dotfile manager repo

This requires `gnu stow` to be installed. So make sure to install it first. 

```sh
sudo apt-get install stow

```


Then create a folder in the `$HOME` directory called `dotfiles` and then run,


```sh
cd dotfile
stow .
```

Now you have all the configurations, for `tmux`, `nvim` and `zsh`!
