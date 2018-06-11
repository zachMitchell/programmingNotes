# Git Book

**[I'm learning from this guide](https://git-scm.com/book/en/v2)**

* Git will take a "snapshot" of your current code, instead of just recording changes. If there wern't any changes to other files before commiting, a link to the previous version is used instead of another copy.
## three stages:

1. committed: everything is saved
1. modified: changed, not committed.
1. staged: the current version of the file will go in the next commit.

* the git config command changes settings based on either global or local (current directory) settings. for global settings, they can be found in .gitconfig

```git config --global user.name = "Zachary"```

Equivelent to .gitconfig:
```
  [user]
    name="Zachary"
```

* If you add something for commit changes, but edit it after you add it, the version from when you added it will be commited instead of your recently edited one.

* you can ignore files that you don't want saved through a file called ".gitignore". [The basic syntax can be found here](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository#_ignoring)

* if you renamed your file to something else, git will catch it.
* a git alias is pretty neat! It's like a bash alias, but for commands used in git: https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases

* If you use an ssh server for sharing a git repo, you can restrict users to only using git commands by running "git-shell" as the default shell!!