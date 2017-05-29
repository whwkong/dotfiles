# README #


## Resources ## 

 * [The best way to manage dotfiles : A bare Git repository](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/ )

   * [Ask HN: What do you use to manage dotfiles?](https://news.ycombinator.com/item?id=11070797)

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

## Usage

```bash
    config clone https://whwkong@bitbucket.org/whwkong/dotfiles.git
    config add ~/.config
    config commit -m 'adding fish config'
    config push -u origin master
```








