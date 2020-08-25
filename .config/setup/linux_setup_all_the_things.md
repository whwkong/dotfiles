# 200815 setup all the things for Ubuntu

## Backup and create new ssh keys

```bash
mkdir -p ~/.ssh/key_backup
cp ~/.ssh/id_rsa* ~/.ssh/key_backup

ssh-keygen -t rsa -b 4096 -C your_email@domain.com
```

## Install apps

* [ ] download chrome
* chrome is not opensource; cannot use apt install
* [ ] download DropBox

* [ ] install keepassx; installation varies
* sudo apt-add-repository ppa:jtaylor/keepass
* sudo apt update
* sudo apt install keepass2

* [ ] install vscode
* [ ] install shan khan's settings sync/or use native vscode settings sync
  * [ ] sync code extensions.  (khan's settings does not sync extensions)

## Setup dotfiles

* [ ] login to github
* [ ] clone dotfiles`git clone git@github.com:whwkong/dotfiles.git`

* [ ] setup dotfiles

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git init --bare $HOME/.cfg
config config --local status.showUntrackedFiles no
git clone https://github.com/whwkong/dotfiles.git
config remote add origin https://github.com/whwkong/dotfiles.git
config checkout master
```

* [ ] run `~/.config/setup/setup_ubuntu.sh`
  * [grc : generic colorizer](https://github.com/garabik/grc)
  * i3
    * rofi - launcher
    * scrot - screen capture tool

## Setup fish, vf

* [ ] `chsh -s /usr/bin/fish`
* [ ] `vf install`
* [ ] `vf addplugin auto_activation`
* [ ] `vf addplugin environment`
* [ ] install [tacklebox](https://github.com/justinmayer/tacklebox)

## Setup vim-plug

`vim-plug` requires the `~/.vim/autoload` file which is in my `dotfiles`.

* [ ] Reload `.vimrc` and run `:PlugInstall` to install plugins.
* [ ] [vim-commentary](https://github.com/tpope/vim-commentary) doesn't install cleanly.  Follow online instructions.

## Setup cheat

* [ ] install [cheat-linux-amd64.gz](https://github.com/cheat/cheat)
* or install old cheat 2.x
* pip3 install cheat  # installs cheat 2.x
  * clone local cheat sheets to ~/.config/cheat
* [ ] clone additional notes > ~/dev/whwkong

Installing `cheat` with `snap`:

```bash
$ sudo snap install cheat
# Add snap to fish path; may need to go into localfish/config_local.fish
# set -gx PATH $PATH /snap/bin
```

## Setup i3

* [ ] setup i3
  * see <https://github.com/addy-dclxvi/i3-starterpack>
  * see <https://www.reddit.com/r/i3wm/comments/ia2sdo/psa_i3gaps_is_nice_for_productivity_too/>
* [ ] install [xflux](https://justgetflux.com/linux.html) to `/usr/local/bin`
  * curently `fluxgui` is unmaintained; just use `xflux`.

## Setup optional apps

* [ ] install Anki
* [ ] pet

## rsync files

* [ ] rsync any required files
  * [ ] fish history is located at ~/.local/share/fish/fish_history

```bash
# ALWAYS do dry-run first!
rsync -anvzP dir1/ dir2   # syncs dir1 to dir2, do dry-run first

rsync -azP --update ~/dir1 username@remote_host:destination_directory  # copy to
rsync -azP --update username@remote_host:/path/to/dir local_destination  # copy from

rsync -a --exclude=pattern_to_exclude --include=pattern_to_include source destination

# -n/--dry-run
# -v/--verbose
# -a/--archive
# -z/--zip
# -P combines --progress/--partial : shows progress bar + allow interrupted transfers
# --update : only update newer files
```

## Possible Errors

os: ubuntu 18.x

```bash
  source: Error encountered while sourcing file “/home/william/.tacklebox/tacklebox.fish”:
  source: No such file or directory
  ERROR: ld.so: object '/usr/lib/x86_64-linux-gnu/libgtk3-nocsd.so.0' from LD_PRELOAD cannot be preloaded (cannot open shared object file): ignored.
```

* See: <https://stackoverflow.com/questions/17723666/error-ld-so-object-ld-preload-cannot-be-preloaded-ignored>

### Issues with vf and Terminator

VirtualFish requires `python` to point to python3.

```bash
$ python --version
3.x
```

Terminator requires `python` to point to python2.

```bash
#! /usr/bin/python2
# to fix, change the terminator shebang
```

