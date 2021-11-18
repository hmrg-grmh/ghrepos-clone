ghrepos-clone ()
{
    `# para`
    
    u="${1:-firecracker-microvm}" \
    p="${2:-1}" \
    per="${3:-100}" \
    proxy="${4:-https://ghproxy.com/https://github.com}" ;
    
    
    
    
    `# doc`

    (($# != 0)) ||
    {
        cat <<HELPDOC ;

Required Commands:

- bash
- tee
- curl
- jq
- xargs
- git


Usage:

  CMD           \$1                 \$2           \$3                        \$4
  -------       ------             -----        -----                     -----
  ghrepos-clone <github-user-name> [which page] [how much repos per page] [proxy]
  
  
  default value is:
    
    ______                     ______
    which page :               $p
    ______                     ______
    how much repos per page :  $per
    ______                     ______
    proxy :                    $proxy
  
  
  demo
    
  - if you wans to gh-clone repos like \`$u/*\`, you can just run this :
    
    ghrepos-clone $u
    
    
  - or if you wans to use page 2, you can run this :
    
    ghrepos-clone $u 2
    
    
  - or you just wans to change the proxy maybe as \`https://gghhhub.iioo\`, you can run this :
    
    ghrepos-clone $u '' '' https://gghhhub.iioo
    
    
  
  And if you need flag like \`--depth\` for \`git clone\` command ,
  You may need to change the codes under '\`# code\`' in these codes .
  
  
%%%% doc here over %%%%

enjoy gh! :)

HELPDOC
        return 0 ;
    } ;
    
    
    
    
    `# code`
    
    curl https://api.github.com/users/"$u"/repos?per_page="$per"\&page="$p" |
        jq '.[]|.full_name' |
        tee -a -- /dev/stderr |
        xargs -i -P0 -- bash -c '
            git clone -q -- '"'$proxy'"'/{}.git {} &&
            { echo :ok :gh :: {} ;; "$(date +%FT%T.%3N%:::z)" ; } ||
            { echo :err :gh :: {} ; }' |
        tee gh-cloning-repos."$u".log ;
} ;
