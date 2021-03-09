#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

start () {
    # This block essentiall checks if this code has been run before
    echo "Please enter the domain of the website you want a proxy for:" 
    read DOMAIN
    checkDomain $DOMAIN domainOrIp start
}

# Ask the user if they want to use a Domain or Ip as thair proxy_pass
domainOrIp () {
    echo "Are you using an ip or domain? This would be proxy_pass: "
    echo "1) Domain "
    echo "2) IP"
    read domainOrIp_opt

    case $domainOrIp_opt in
    "") echo "You didn't pick anything. Please try again"
        domainOrIp 
    ;;
    1) getProxyInfoDomain $DOMAIN
    ;;
    2) getProxyInfoIp $DOMAIN
    esac

}

# If the user chooses to use an IP as their proxy_pass get the ip then validate it
getProxyInfoIp () {
    echo "      Making proxy for $DOMAIN      "
    echo "   You chose to redirect to an IP   "
    echo "------------------------------------"
    echo "Please enter the ip your wish to proxy to"
    read PROXY_IP_HOST
    checkValidIp $checkValidIp
}

# If the user wants to use a domain as thair proxy_pass get the domain then validate it
getProxyInfoDomain () {
    echo "      Making proxy for $DOMAIN      "
    echo "  You chose to redirect to a Domain  "
    echo "-------------------------------------"
    echo "Please enter the domain your wish to proxy to"
    read $PROXY_DOMAIN_HOST
    checkDomain $PROXY_DOMAIN_HOST getProxyPort getProxyInfoDomain
}

# This block is self explanitory checks domain with regex
checkDomain () {
    DOMAIN_REGEX='^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,}$'

    echo $1 | grep -qE "$DOMAIN_REGEX"
    case $? in 
        1)  echo -e "${RED} /!\ You did not enter a vlid domain try again /!\ ${NC}"
            $3
        ;;
        0)  $2
    esac
}

# Validates the ip againts regex
checkValidIp () {
    ipRegex='^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
    echo $PROXY_IP_HOST | grep -qE "$ipRegex"
    case $? in 
    '0')  getProxyPort
    ;;
    '1')  echo $?
        echo "FALSE"
        echo -e "        ${RED}/!\ IP INVALID /!\ ${NC}"
        getProxyInfoIp
    esac
}

getProxyPort () {
    echo "Enter a port: "
}

start

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