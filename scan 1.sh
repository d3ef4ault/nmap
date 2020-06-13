#/bin/bash
#扫描内网所有主机，获取MAC地址
 
ETH=$(ifconfig | grep "eth" | awk '{print $1}')
NET="192.168.0"
 
for((i=1;i<255;i++))
do
    res=$(arping -c 2 -w 1 $NET.$i -I $ETH | grep "reply from" | awk '{print $4","$5}')
    #echo $res
    test -z $res
    if [ $? -eq 1 ]
    then
        echo "$res" >> mac.txt
        echo "$NET.$i的MAC地址已写入mac.txt"
    else
        echo "$NET.$i is down"
    fi
done
echo "finish"
