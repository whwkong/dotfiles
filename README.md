# README #


## Resources ## 

 * [The best way to manage dotfiles : A bare Git repository](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/ )

 * <https://dotfiles.github.io/>

 ***
 
 
## Starting from scratch ##

```bash
    git init --bare $HOME/.cfg
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    config config --local status.showUntrackedFiles no
```

 * [--git-dir](https://git-scm.com/docs/git#git---git-dirltpathgt) 
     - Set the path to the repository; specifies `~/.cfg` folder which is a Git bare repository that will track our files
 * [--work-tree=<path>](https://git-scm.com/docs/git#git---work-treeltpathgt)
     - Set the path to the working tree 
 * [config --local status.showUntrackedFiles no](https://git-scm.com/docs/git-config#git-config-statusshowUntrackedFiles)
     - set flag local to this repo; hide files we are not explicitly tracking.  This prevents `config status` from displaying files that you are not explictly tracking. 

## Migrating to a new setup  

```bash
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    echo ".cfg" >> .gitignore
    git init --bare $HOME/.cfg
    config config --local status.showUntrackedFiles no
    git clone https://github.com/whwkong/dotfiles.git
    config remote add origin https://github.com/whwkong/dotfiles.git
    config checkout    
```

