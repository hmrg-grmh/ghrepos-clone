# GitHub Repos Cloner

clone all repos from a user.

writed in `BASH`, just a simple tool.

## install

1. download (or just copy) the file [`github-repos-fun.sh`](./github-repos-fun.sh)  
2. move it under the path `/etc/bash_completion.d`  


To init it, run command `. /etc/bash_completion.d/github-repos-fun.sh`  
Or just start a new Bash, as like as run the command `exec bash`  

Then, you can run `ghrepos-clone` to see the help doc, and use it!

## requires

In your environment, you must install these commands at first which if not be:

- `bash`
- `tee`
- `curl`
- `jq`
- `xargs`
- `git`

