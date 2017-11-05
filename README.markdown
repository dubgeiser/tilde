# Tilde

Collection of config-, script-, dotfiles, etc... one is likely to find in a
regular *NIX like home directory.

The name is taken from https://github.com/janmoesen/tilde
I always thought it was better naming than `etc` or `dotfiles`.

Instead of symlinking all the stuff, I took the approach of hardcore pulling
into the home directory, cf. https://github.com/garybernhardt/dotfiles/

My vim config is still a separate repo, I'm undecided on whether or not to
merge it with tilde, or make it a submodule, or...


## Install

    $ cd
    $ git init
    $ git remote add origin <gitrepo>
    $ git pull origin master

Resolve conflicts as necessary.

vim:spell tw=78:
