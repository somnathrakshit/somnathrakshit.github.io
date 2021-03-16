---
title: "My Git Command Collection"
date: 2021-03-15
---
# My Git Command Collection

Like many other people, I tend to be frustrated often trying to find the right command while using Git. This document is an attempt to collect as many useful commands from various places on the internet to make commands easier to find in a single location.

## Before You Begin

It is always a good idea to take a backup of your entire working directory including .git before you attempt anything mentioned here.

## Saving Uncommitted Changes
Sometimes, you might work on something before realising that you won't need it at that point of time. If you don't want to delete that work, and instead, save it for some other day, here are some of the things that you can do.

| Description                                           | Command                                                                                                                                |
|-------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Commit them on the local branch                       | `git commit -am "My descriptive message"`                                                                                              |
| Commit them on another branch, no checkout conflicts. | `git checkout otherbranch && git commit -am "My descriptive message"`                                                                  |
| Commit them on another branch, conflicts.             | `git stash; git checkout otherbranch; git stash apply; : "resolve conflicts"; git commit -am "My descriptive message"; git stash drop` |
| Commit them on a new branch.                          | `git checkout -b newbranch; git commit -am "My descriptive message"`                                                                   |
| Stash them for a rainy day.                           | `git stash save "my descriptive name"`                                                                                                 |

## How to undo all uncommitted changes
So you have not yet committed and you want to undo everything. Well, best practice is for you to stash the changes in case you were mistaken and later decide that you really wanted them after all. `git stash save "description of changes"`. You can revisit those stashes later by `git stash list` and decide whether to `git stash drop` them after some time has past. Please note that untracked and ignored files are not stashed by default. See `"--include-untracked"` and `"--all"` for stash options to handle those two cases.

However, perhaps you are confident (or arrogant) enough to know for sure that you will never ever want the uncommitted changes. If so, you can run `git reset --hard`, however please be quite aware that this is almost certainly a completely unrecoverable operation. Any changes which are removed here cannot be restored later. This will not delete untracked or ignored files. Those can be deleted with `git clean -nd; git clean -ndX` respectively, or `git clean -ndx` for both at once. Well, actually those command do not delete the files. They show what files will be deleted. Replace the `"n"` in `"-nd…"` with `"f"` to actually delete the files. Best practice is to ensure you are not deleting what you should not by looking at the moribund filenames first.

## How to undo some uncommitted changes
So you have not yet committed and you want to undo some things, well git status will tell you exactly what you need to do. For example:
```bash
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
#       new file:   .gitignore
#
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git checkout -- <file>..." to discard changes in working directory)
#
#       modified:   A
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
#       C
```
However, the `git checkout` in file mode is a command that cannot be recovered from—the changes which are discarded most probably cannot be recovered. Perhaps you should run `git stash save -p "description"` instead, and select the changes you no longer want to be stashed instead of zapping them.

# Do you have uncommitted stuff in your working directory?
So you have committed. However, before we go about fixing or removing whatever is wrong, you should first ensure that any uncommitted changes are safe, by either committing them (`git commit`) or by stashing them (`git stash save "message"`) or getting rid of them.

`git status` will help you understand whether your working directory is clean or not. It should report nothing for perfect safety ("Untracked files" only are sometimes safe.)

<script async src="https://comments.app/js/widget.js?3" data-comments-app-website="u3US6zJB" data-limit="5" data-color="343638"></script>
