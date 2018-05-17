- git config --list
- git init
- git add -i
- git remote -v
- git remote add origin 
https://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes
- vim -M

```bash
withbeth@JongEunJeongui-MacBook-Pro:~/_git/configs$ git push
fatal: The current branch master has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin master

withbeth@JongEunJeongui-MacBook-Pro:~/_git/configs$ git push -u origin master
Username for 'https://github.com': withbeth
Password for 'https://withbeth@github.com':
Counting objects: 3, done.
Writing objects: 100% (3/3), 232 bytes | 232.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/withbeth/configs.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.

withbeth@JongEunJeongui-MacBook-Pro:~/_git/configs$ git remote -v
origin	https://github.com/withbeth/configs.git (fetch)
origin	https://github.com/withbeth/configs.git (push)



:git diff HEAD origin/master # diff shows what will be applied if I accept the remote change
:git fetch origin            # to update the remote branch in your repository to point to the latest version
:git merge origin/master     # If you want to accept the remote changes:
:git show-branch *master
:git log origin/master
```
