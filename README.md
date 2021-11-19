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

**But, `/etc/bash_completion.d` is not very currect also, it just works ...**

you can add it to your `~/.bashrc`, or run this if you would like to create a `/etc/bashrc.d` :

~~~~ bash
bashrc-dir-init ()
{
    echo '

## bashrc.d
[[ -d /etc/bashrc.d ]] || { mkdir -p -- /etc/bashrc.d ; touch /etc/bashrc.d/{_.bash,_.sh} ; } ; (cd /etc/bashrc.d && ls -1b -- _.* | tr -- _ \* | xargs | tr -- \  , | xargs -i -- bash -c '"'"'ls -1bd -- /etc/bashrc.d/{{}}'"'"') | while read f ; do source "$f" ; done 
' >> /etc/bashrc &&
    . /etc/bashrc ;
} &&
sudo bash -c "$(declare -f bashrc-dir-init) ; (bashrc-dir-init) ; exit "'$? ;'
~~~~

and you can add some file like `_.foo`, then your `/etc/bashrc` will `source` the files named `*.foo` under the dir `/etc/bashrc.d` .

***Well ... I suggest you source it manually if you don't like put it under `/etc/bash_completion.d` .***

## requires

In your environment, you must install these commands at first which if not be:

- `bash`
- `tee`
- `curl`
- `jq`
- `xargs`
- `git`

