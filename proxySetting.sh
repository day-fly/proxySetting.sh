#!/bin/sh
#proxySetting.sh
#여러가지 프록시 세팅을 한번에 합니다.

read  -p "Input your proxy ip : " ip
read  -p "Input your proxy port : " port

echo
echo "### Proxy Setting Menu ###"
echo "1 : npm - set proxy"
echo "2 : npm - unset proxy "
echo "3 : git - set proxy "
echo "4 : git - unset proxy "
echo "99 : exit"

chk=0
input=0
while [ 99 -ne ${input} ]
do
    read -p "Select number : " input
    echo "입력받은 값 : " ${input}

    case $input in
        1)
            echo "npm config set proxy http://${ip}:${port} ..."
            npm config set proxy http://${ip}:${port} || chk = 1
            if [ ${chk} -eq 1 ];then
                echo "You have to install npm."
                chk=0
            else
                echo "npm config set https-proxy http://${ip}:${port} ..."
                npm config set https-proxy http://${ip}:${port}
                echo "npm config set strict-ssl false ..."
                npm config set strict-ssl false
                echo "done !!"
                cat ~/.npmrc
            fi
            ;;
         2)
            echo "npm config delete https-proxy ..."
            npm config delete https-proxy || chk=1
            if [ ${chk} -eq 1 ];then
                echo "You have to install npm."
                chk=0
            else
                echo "npm config delete proxy ..."
                npm config delete proxy
                echo "npm config delete strict-ssl ..."
                npm config delete strict-ssl
                echo "done !!"
            fi
            ;;
         3)
            echo "git config --global http.proxy http://${ip}:${port} ..."
            git config --global http.proxy http://${ip}:${port} || chk=1
            if [ ${chk} -eq 1 ];then
                echo "You have to install git."
                chk=0
            else
                echo "git config --global https.proxy http://${ip}:${port} ..."
                git config --global https.proxy http://${ip}:${port}
                echo "done !!"
                cat ~/.gitconfig
            fi
            ;;
         4)
            echo "git config --global --unset http.proxy ..."
            git config --global --unset http.proxy || chk=1
            if [ ${chk} -eq 1 ];then
                echo "You have to install git."
                chk=0
            else
                echo "git config --global --unset https.proxy ..."
                git config --global --unset https.proxy
                echo "done !!"
            fi
            ;;
          5) abcd || chk=1
            if [ ${chk} -eq 1 ];then
                echo "You have to install git."
                chk=0
            else
                echo "aaaa"
            fi
            ;;
         99)
            echo "bye"
            ;;
        *) echo "Select number"
            ;;
    esac
done