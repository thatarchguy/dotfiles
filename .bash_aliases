
alias fucking='sudo !!'
alias cpz='rsync -aP'
alias ls='ls --color=auto'
alias ll='ls -la | lolcat'

alias mntdisas="sshfs -o idmap=user,follow_symlinks disasterbate: /srv/disas"
alias umntdisas="fusermount -u /srv/disas"
alias vpndisas="sudo systemctl start openvpn@arch"
alias vpnoff="sudo systemctl stop openvpn@arch"

alias pacin='sudo pacman -S'

alias eqz='alsamixer -D equal'

bind Space:magic-space


gcm() {
    git commit -m"`curl -s http://quote.escapethebot.net`"
}

function cs () {
    cd "$@" && ls
}

function scratch {
vim ~/tmp/$(openssl rand -base64 10 | tr -dc 'a-zA-Z').txt
}

function weather () {
curl -s wttr.in |sed -n 1,6p
}

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"


# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'


