ghrepos-clone ()
{
    `# para`
    
    u="${1:-firecracker-microvm}" \
    p="${2:-1}" \
    per="${3:-100}" \
    proxy="${4:-https://ghproxy.com/https://github.com}" \
    type="${5:-}" ;
    
    
    
    
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

  CMD           \$1                 \$2           \$3                        \$4      \$5
  -------       ------             -----        -----                     -----   -----
  ghrepos-clone <github-user-name> [which page] [how much repos per page] [proxy] [type]
  
  
  default value is:
    
    ______                     ______
    which page :               ${p:-<nil>}
    ______                     ______
    how much repos per page :  ${per:-<nil>}
    ______                     ______
    proxy :                    ${proxy:-<nil>}
    ______                     ______
    type :                     ${type:-<nil>}
  
  
  demo
    
  - if you wans to gh-clone repos like \`$u/*\`, you can just run this :
    
    ghrepos-clone $u
    
    
  - or if you wans to use page 2, you can run this :
    
    ghrepos-clone $u 2
    
    
  - or you just wans to change the proxy maybe as \`https://gghhhub.iioo\`, you can run this :
    
    ghrepos-clone $u '' '' https://gghhhub.iioo
    
    
  - or if you just wans to download the wiki :
    
    ghrepos-clone $u '' '' '' wiki
    
    
  
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
        xargs -i -- echo "{}${type:+.$type}"
        tee -a -- /dev/stderr |
        xargs -i -P0 -- bash -c '
            git clone -q -- '"'$proxy'"'/{}.git {} &&
            { echo :ok :gh :: {} ;; "$(date +%FT%T.%3N%:::z)" ; } ||
            { echo :err :gh :: {} ; }' |
        tee gh-cloning-repos."$u".log ;
} ;
