#!usr/bin/env bash
echo 欢迎使用PD Host Locker
echo 本程序由Ligure Studio开发，基于MIT开源，请在提示时输入您的密码（密码不会显示）
echo 我们的官网:ligure.cn
echo ---------------------------------------------------
echo [1].修改、备份并锁定hosts
echo [2].恢复到备份的hosts并解除锁定
echo [n].退出
read input
if [ "$input" == "1" ]
then
	mkdir ~/PDHostsLocker_Backup
	cp /etc/hosts ~/PDHostsLocker_Backup
	sudo echo '#PD Hosts Locker Start' >> /etc/hosts
	sudo echo >> /etc/hosts
	sudo echo "
127.0.0.1 download.parallels.com
127.0.0.1 update.parallels.com
127.0.0.1 desktop.parallels.com
127.0.0.1 download.parallels.com.cdn.cloudflare.net
127.0.0.1 update.parallels.com.cdn.cloudflare.net
127.0.0.1 desktop.parallels.com.cdn.cloudflare.net
127.0.0.1 www.parallels.cn
127.0.0.1 www.parallels.com
127.0.0.1 www.parallels.de
127.0.0.1 www.parallels.es
127.0.0.1 www.parallels.fr
127.0.0.1 www.parallels.nl
127.0.0.1 www.parallels.pt
127.0.0.1 www.parallels.ru
127.0.0.1 www.parallelskorea.com
127.0.0.1 reportus.parallels.com
127.0.0.1 parallels.cn
127.0.0.1 parallels.com
127.0.0.1 parallels.de
127.0.0.1 parallels.es
127.0.0.1 parallels.fr
127.0.0.1 parallels.nl
127.0.0.1 parallels.pt
127.0.0.1 parallels.ru
127.0.0.1 parallelskorea.com
127.0.0.1 pax-manager.myparallels.com
127.0.0.1 myparallels.com
127.0.0.1 my.parallels.com
	" >> /etc/hosts
	sudo echo >> /etc/hosts
	sudo echo '#PD Hosts Locker End' >> /etc/hosts
	sudo chflags uchg /etc/hosts
	sudo chflags schg /etc/hosts
	sudo chflags hidden ~/PDHostsLocker_Backup
	echo 操作已完成，请在弹出的窗口中检查
	open /etc/hosts
elif [ "$input" == "2" ]
then
	sudo chflags nouchg /etc/hosts
	sudo chflags noschg /etc/hosts
	sudo rm -rf /etc/hosts
	sudo cp ~/PDHostsLocker_Backup/hosts /etc/
	sudo rm -rf ~/PDHostsLocker_Backup
	echo 操作已完成，请在弹出的窗口中检查
	open /etc/hosts
else
	sleep 1
	exit 0
fi
