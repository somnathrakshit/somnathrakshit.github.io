---
title: "My Git Command Collection"
date: 2021-03-15
---
# My Git Command Collection
Like many other people, I tend to be frustrated often trying to find the right command while using Git. This document is an attempt to collect as many useful commands from various places on the internet to make commands easier to find in a single location. I used some excellant resources such as [this](https://sethrobertson.github.io/GitFixUm/fixup.html) while creating this.

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
So you have not yet committed and you want to undo some things. Well, ``git status`` will tell you exactly what you need to do. For example:
```bash
$ git status
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

## Do you have uncommitted stuff in your working directory?
So you have committed. However, before we go about fixing or removing whatever is wrong, you should first ensure that any uncommitted changes are safe, by either committing them (`git commit`) or by stashing them (`git stash save "message"`) or getting rid of them.

`git status` will help you understand whether your working directory is clean or not. It should report nothing for perfect safety ("Untracked files" only are sometimes safe.)

### Discarding all local commits on this branch
In order to discard all local commits on this branch, to make the local branch identical to the "upstream" of this branch, simply run ``git reset --hard @{u}``.

### Replacing all branch history/contents
If instead of discarding all local commits, you can make your branch identical to some other branch, tag, ref, or SHA that exists on your system.

The first thing you need to do is identify the SHA or ref of the good state of your branch. You can do this by looking at the output of ``git log --all`` or look graphically at ``gitk --all --date-order``.

Once you have found the correct state of your branch, you can get to that state by running ``git reset --hard REF``.
Obviously replace ``REF`` with the reference or SHA you want to get back to.

## Removing the last commit
To remove the last commit from git, you can simply run ``git reset --hard HEAD^`` If you are removing multiple commits from the top, you can run ``git reset --hard HEAD~2`` to remove the last two commits. You can increase the number to remove even more commits.

If you want to "uncommit" the commits, but keep the changes around for reworking, remove the ``--hard``: ``git reset HEAD^`` which will evict the commits from the branch and from the index, but leave the working tree around.

If you want to save the commits on a new branch name, then run ``git branch newbranchname`` before doing the git reset.

## Reworking the last commit
WARNING: These techniques should only be used for non-merge commits. If you have a merge commit, you are better off deleting the merge and recreating it.

If you want to perform significant work on the last commit, you can simply ``git reset HEAD^``. This will undo the commit (peel it off) and restore the index to the state it was in before that commit, leaving the working directory with the changes uncommitted, and you can fix whatever you need to fix and try again.

You can do this with multiple (non-merge) commits in a row (using ``HEAD^^`` or similar techniques), but then of course you lose the separation between the commits and are left with an undifferentiated working directory. If you are trying to squash all of the commits together, or rework which bits are in which commits, this may be what you want.

## Moving a commit from one branch to another
So, you have a commit which is in the wrong place and you want to move it from one branch to another. In order to do this, you will need to know the SHA of the first and last commit (in a continuous series of commits) you want to move (those values are the same if you are moving only one commit), the name of the branch you are moving the commit from, and the name of the branch you are moving the commit to. In the example below, I will name these four values ``$first``, ``$last``, ``$source``, and ``$destination`` (respectively). Additionally, you will need to use a nonce branch as a placeholder. I will call the nonce branch ``nonce`` in the following example. However, you may use any branch name that is not currently in use. You can delete it immediately after you are done.
```bash
git branch nonce $last
git rebase -p --onto $destination $first^ nonce
```
Remember that when you substitute ``$first`` in the command above, leave the ``^`` alone, it is literal.

Use ``gitk --all --date-order`` to check to make sure the move looks correct (pretending that nonce is the destination branch). Please check very carefully if you were trying to move a merge, it may have been recreated improperly. If you don't like the result, you may delete the nonce branch (``git branch -D nonce``) and try again.

However, if everything looks good, we can move the actual destination branch pointer to where nonce is:

```bash
git checkout $destination
git reset --hard nonce
git branch -d nonce
```
If you double-checked with ``gitk --all --date-order``, you would see that the destination branch looks correct. However, the commits are still on the source branch as well. We can get rid of those now:
```bash
git rebase -p --onto $first^ $last $source
```
Using ``gitk --all --date-order`` one last time, you should now see that the commits on the source branch have gone away. You have successfully moved the commits. Please check very carefully if merges occurred after the commits which were deleted. They may have been recreated incorrectly. If so you can either undo the delete or try to delete the bad merge and try to recreate it manually, or create a fake (--ours) merge from the same SHA so that git is aware that the merge occurred.

## Undoing the last few git operations affecting HEAD/my branch's tip
Practically every git operation which affects the repository is recorded in the git reflog. You may then use the reflog to look at the state of the branches at previous times or even go back to the state of the local branch at the time.

While this happens for every git command affecting HEAD, it is usually most interesting when attempting to recover from a bad rebase or reset or an ``--amend``'ed commit. There are better ways (listed by the rest of this document) from recovering from the more mundane reflog updates.

The first thing you need to do is identify the SHA of the good state of your branch. You can do this by looking at the output of ``git log -g`` or, my preference, you can look graphically at ``gitk --all --date-order $(git log -g --pretty=%H)``.

Once you have found the correct state of your branch, you can get back to that state by running
```bash
git reset --hard SHA
```
You could also link that old state to a new branch name using
```bash
git checkout -b newbranch SHA
```
Obviously replace ``SHA`` in both commands with the reference you want to get back to.

Note that any other commits you have performed since you did that "bad" operation will then be lost. You could ``git cherry-pick`` or ``git rebase -p --onto`` those other commits over.
<script async src="https://comments.app/js/widget.js?3" data-comments-app-website="u3US6zJB" data-limit="5" data-color="343638"></script>
