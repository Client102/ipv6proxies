echo pidfile /root/3proxy/3proxy.pid

echo daemon
echo maxconn 250
echo nserver 1.1.1.1
echo nserver [2606:4700:4700::1111]
echo nserver [2606:4700:4700::1001]
echo nserver [2001:4860:4860::8888]
echo nscache6 65536
echo nscache 65536
echo timeouts 1 5 30 60 180 1800 15 60
echo setgid 65535
echo setuid 65535
echo flush
echo #auth strong
echo #users admin:CL:pass
echo #allow admin
echo "auth iponly"
echo "allow * 185.230.141.163"



port=30001
count=250
for i in `cat ip.list`; do
    echo "proxy -6 -n -a -p$port -i127.0.0.1 -e$i"
    ((port+=1))
    ((count+=1))
    if [ $count -eq 10001 ]; then
        exit
    fi
done
