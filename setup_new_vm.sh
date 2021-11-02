#!/bin/bash

read -r -p "Assign new hostname? (y/n)" reply
if [ $reply == 'y' ]; then
    read -r -p "New hostname: " hostname

    if [ -n $hostname ]; then
        echo "Set hostname to " $hostname
        echo $hostname | sudo tee /etc/hostname >> /dev/null
        sudo sed -i "s/127\\.0\\.1\\.1.*/127\\.0\\.1\\.1 ${hostname}/g" /etc/hosts
    fi
fi

read -r -p "Create new sudo user? (y/n)" reply
if [ $reply == 'y' ]; then
    read -r -p "New user name: " username
    if [ -n $username ]; then
        sudo adduser $username

        if [ $? == 0 ]; then
            for g in $(groups); do
                if [ $g != $USER ]; then
                    sudo adduser $username $g
                fi
            done

            sudo mkdir -v /home/$username/.ssh
            sudo cp -v ${HOME}/.ssh/authorized_keys /home/$username/.ssh/
            sudo chown -R -v $username:$username /home/$username/.ssh
            sudo chmod -v 0700 /home/$username/.ssh
            sudo chmod -v 0600 /home/$username/.ssh/authorized_keys
        fi
    fi
fi


read -r -p "Change apt repository from ubuntu to cht mirror (y/n)" reply
if [ $reply == 'y' ]; then
    sudo sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu/http:\/\/mirror01.idc.hinet.net\/ubuntu/g' /etc/apt/sources.list
fi

read -r -p "Add apt proxy (y/n)" reply
if [ $reply == 'y' ]; then
    read -r -p "input proxy url: " proxy_url
    if [ -n $proxy_url ]; then
        cat << EOF | sudo tee /etc/apt/apt.conf.d/90curtin-aptproxy
Acquire::http::Proxy "$proxy_url";
Acquire::https::Proxy "$proxy_url";
EOF

    fi
fi

