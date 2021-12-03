ghrepos-clone ()
{
    `# para`
    
    n="${1:-firecracker-microvm}" \
    p="${2:-1}" \
    per="${3:-100}" \
    proxy="${4:-https://ghproxy.com/https://github.com}" \
    type="${5:-}" ;
    
    
    
    
    `# doc`
    
    (($# != 0)) ||
    {
        cat <<HELPDOC ;

Required Commands:
  bash tee curl jq xargs git


Usage:
  
  CMD           \$1        \$2         \$3         \$4      \$5
  -------       ------    -----      -----      -----   -----
  ghrepos-clone <gh-name> [page num] [page len] [proxy] [type]
  
  
  default value is:
    
    ______                 ______
    page num :             ${p:-<nil>}
    ______                 ______
    page len :             ${per:-<nil>}
    ______                 ______
    proxy :                ${proxy:-<nil>}
    ______                 ______
    type :                 ${type:-<nil>}
    
  
  demo
  
  - if you wans to gh-clone repos 
    like \`$n/*\`, you can just 
    run this :
  
    ghrepos-clone $n
    
  
  - or if you wans to 
    use page 2, you can 
    run this :
  
    ghrepos-clone $n 2
    
  
  - or you just wans to 
    change the proxy maybe 
    as \`https://gghhhub.iioo\`, you can 
    run this :
  
    ghrepos-clone $n '' '' https://gghhhub.iioo
    
  
  - or if you just wans to 
    download the wiki :
  
    ghrepos-clone $n '' '' '' wiki
    
  
  - clone single repo 
    such as \`zettlr/zettlr\` :

    ghrepos-clone zettlr/zettlr

  
  
  And if you need flag like \`--depth\` for \`git clone\` command ,
  You may need to change the codes under '\`# code\`' in these codes .
  

%%%% doc here over %%%%

enjoy gh! :)

HELPDOC
        return 0 ;
    } ;
    
    
    
    
    `# code`
    
    repos_ ()
    {
        curl https://api.github.com/users/"$n"/repos?per_page="$per"\&page="$p" |
            jq '.[]|.full_name' |
            xargs -i -- echo "{}${type:+.$type}" |
            tee -a -- /dev/stderr |
            xargs -i -P1 -- bash -c '
                git clone -q -- '"'$proxy'"'/{}.git {} &&
                { echo :ok :gh :: {} ... "$(date +%FT%T.%3N%:::z)" ; } ||
                { echo :err :gh :: {} ; }' |
            tee gh-cloning-repos."$n".log ;
    } ;
    
    repo_ ()
    {
        git clone -- "$proxy"/"$n".git "$n" &&
        { echo :o :gh :: "$n" .. "$(date +%FT%T.%3N%:::z)" ; } ||
        { echo :e :gh :: "$n" ; } |
            tee -a gh-cloning-repos."$(dirname "$n")".log ;
    } ;

    `# run`

    (("$(expr length "$(dirname "$n")")" != 0)) &&
    { repo_ ; } || { repos_ ; } ;
} ;

