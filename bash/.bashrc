source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

export PS1='\[\e[36m\]\w\[\e[92m\]$(__git_ps1 "[%s]")\[\e[0m\]\$ '
alias vi='nvim'
set -o noclobber
alias ssh='ssh -XY'
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
export LSCOLORS=ExGxcxdxCxegedabagacec


function xssh_local() {
    xpanes -c 'ssh {}_local' $@
}
function xssh() {
    xpanes -c 'ssh {}' $@
}
function xssh_list() {
    flat=$(cat $1|tr '\n' ' ');
    if [ $# -ge 2 ] && [ $2 = l ]; then
        xssh_local $flat;
    else
        xssh $flat;
    fi
}
function get_aws_id() {
    key=$1;
    cat ~/.ssh/aws_servers|awk '$1 == "'${key}'" { print $2 }';
}
function ssh_aws() {
    ssh -i ~/.ssh/takayuki_yoshi_alchemist.pem ubuntu@$(get_aws_id $1);
}
function xssh_aws() {
    xpanes -c 'ssh_aws {}' $@;
}
function scp_from_aws() {
    id=$(get_aws_id $1);
    scp -i ~/.ssh/takayuki_yoshi_alchemist.pem -r ubuntu@$id:$2 $3
}
function scp_to_aws() {
    id=$(get_aws_id $1);
    scp -i ~/.ssh/takayuki_yoshi_alchemist.pem -r $2 ubuntu@$id:$3
}
