#! /bin/bash
cont_count=$1
echo "Creating $cont_count containers .."
sleep 2;
for i in `seq $cont_count`
do
	echo "===========-------------"
	echo "Creating www.employee$i container..."
	sleep 1;
docker run -it --name www.employee$i -it vani99/employee-img /bin/bash
echo "www.employee$i container has been created"
echo "========================="
done
docker inspect --format {{.NetworkSettings.Networks.bridge.IPAddress}} `docker ps -a -q` > Ips.txt
