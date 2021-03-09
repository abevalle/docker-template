#!/bin/bash

start () {
    
    # This block essentiall checks if this code has been run before
    if [ $1 ]
        then
            echo "Please enter the domain of the website you want a proxy for:" 
            read DOMAIN
            checkDomain $DOMAIN
            
    else # If the code hasn't been run before then clear the screen
        clear
        echo "Please enter the domain of the website you want a proxy for:" 
        read DOMAIN
        checkDomain $DOMAIN
    fi
}

checkDomain () {
    DOMAIN_REGEX='^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,}$'

    echo $1 | grep -qE "$DOMAIN_REGEX"
    case $? in 
        1)  clear
            echo DOMAIN RESULT: $?
            echo "You did not enter a website try again..."
            start 1
        ;;
        0)  getProxyInfoIp $DOMAIN
    esac
}

domainOrIp () {
    echo "Are you proxying to an ip or proxy?"
}

getProxyInfoDomain () {
    echo "test";
}

getProxyInfoIp () {
    echo "      Making proxy for $DOMAIN      "
    echo "   You chose to redirect to an IP   "
    echo "------------------------------------"
    echo "Please enter the ip your wish to proxy to"
    read PROXY_IP_HOST
    checkValidIp $checkValidIp
}

getProxyInfoDomain () {
    echo "      Making proxy for $DOMAIN      "
    echo "  You chose to redirect to a Domain  "
    echo "-------------------------------------"
    echo "Please enter the ip your wish to proxy to"
    read PROXY_IP_HOST
    checkValidIp $checkValidIp
}

checkValidIp () {
    ipRegex='^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$'
    echo $PROXY_IP_HOST | grep -qE $ipRegex
    echo $?
    case $? in 
    1)  echo "IP VALID"
    ;;
    0)  clear
        echo "          /!\ IP VALID /!\\"
        getProxyInfoIp
    esac
}

start

# echo "Where would you like the domain to point to:"
# read PROXY_HOST
# echo "What port should the proxy point to:"
# read PROXY_PORT

# echo "Your reverse proxy will point to $PROXY_HOST:$PROXY_PORT from $DOMAIN"

# server {
#     listen 80;
#     server_name $DOMAIN;

#     access_log /var/log/nginx/$DOMAIN.access.log;
#     error_log /var/log/nginx/$DOMAIN.error.log;
    
#     location / {
#         proxy_set_header Host \$host;
#         proxy_pass $PROXY_HOST:$PROXY_PORT;
#         proxy_redirect off;
#         proxy_set_header X-Real-IP \$remote_addr;
#         proxy_set_header X-Forwarded-Proto https;
#     }

# }