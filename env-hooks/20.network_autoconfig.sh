if [ "$ROS_INTERFACE" = "auto" ]; then
    default_route=$(ip -oneline route get 255.255.255.255 | sed 's/^.*dev \(\w*\) \+src \([0-9.]*\) .*$/\1:\2/')
    if [ ! -z "${default_route}" ]; then
        export ROS_INTERFACE=${default_route%:*}
        export ROS_IP=${default_route#*:}
        export ROS_MASTER_URI=http://$ROS_IP:11311
    fi
elif [ "$ROS_INTERFACE" = "local" ]; then
    if [ -z "$HOSTNAME" ]; then
        HOSTNAME=$(hostname)
    fi
    export ROS_HOSTNAME=$HOSTNAME.local
    export ROS_MASTER_URI=http://$HOSTNAME.local:11311
elif [ ! -z "${ROS_INTERFACE}" ]; then
    ip=$(nmcli -t -f IP4.ADDRESS d show $ROS_INTERFACE | sed 's/^.*:\([0-9.]*\)\/[0-9.]\{1,2\}$/\1/')
    if [ ! -z "${ip}" ]; then
        export ROS_IP=$ip
        export ROS_MASTER_URI=http://$ROS_IP:11311
    fi
fi
