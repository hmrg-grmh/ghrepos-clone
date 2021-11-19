# GitHub Repos Cloner

clone all repos from a user.

writed in `BASH`, just a simple tool.

## install

1. download (or just copy) the file [`github-repos-fun.sh`](./github-repos-fun.sh)  
2. move it under the path `/etc/bash_completion.d`  
3. to init it, run command `. /etc/bash_completion.d/github-repos-fun.sh`, or just start a new `bash` like run cmd `exec bash`  

Then, you can run `ghrepos-clone` to see the help doc and use it!

## requires

In your environment, you must install these commands at first which if not be:

- `bash`
- `tee`
- `curl`
- `jq`
- `xargs`
- `git`

