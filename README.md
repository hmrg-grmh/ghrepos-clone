# GitHub Repos Cloner

clone all repos from a user.

writed in `BASH`, just a simple tool.

## install

1. download (or just copy) the file [`github-repos-fun.bash`](./github-repos-fun.bash)  
2. move it under the path `/etc/bash_completion.d`  


To init it, run command `. /etc/bash_completion.d/github-repos-fun.sh`  
Or just start a new Bash, as like as run the command `exec bash`  

Then, you can run `ghrepos-clone` to see the help doc, and use it!

## attention

Do not let this file into `/etc/profile.d` **or you will get problem when you use `sh`!!**  

in the file `/etc/profile` we can also see things like that:

~~~
# /etc/profile

# System wide environment and startup programs, for login setup
# Functions and aliases go in /etc/bashrc
~~~

look, **`Functions and aliases go in /etc/bashrc`**, not the `profile`.  
( and in `sh`, function name can not be like `foo-bar`. )  

... well, in fact, you can also only copy the codes to use on the bash, with out the init/install. .... when you need it.

## requires

In your environment, you must install these commands at first which if not be:

- `bash`
- `tee`
- `curl`
- `jq`
- `xargs`
- `git`

