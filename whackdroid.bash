#!/data/data/com.termux/files/usr/bin/bash

VERSION='1.0';
APPSDIR="/data/data/com.termux/files/usr/share/whackdroid";
echo "       _           _     _         _   _ ";
echo " _ _ _| |_ ___ ___| |_ _| |___ ___|_|_| |";
echo "| | | |   | .'|  _| '_| . |  _| . | | . |";
echo "|_____|_|_|__,|___|_,_|___|_| |___|_|___|";
echo "--- V 1.0 - 0byte Termux Tool Project ---";
echo "---                by www.zerobyte.id ---";
echo "";
echo "### Web Cracking ###";
echo "[1] Webadmin Finder";
echo "[2] Reverse IP (Yougetsignal)";
echo "";
echo "[?] Help";
echo "[!] Upgrade";
echo "[0] Exit from Tools";
echo "";
echo -ne "select@number:-> ";
read MENU

if [[ ${MENU} == '!' ]];
then
	echo "[INFO] Upgrade...";
	LASTUPDATE=$(curl -s "https://raw.githubusercontent.com/zerobyte-id/0byttt-whackdroid/master/VERSION");
	if [[ ${LASTUPDATE} == ${VERSION} ]];
		then
		echo "[FAIL] Your version has been latest version!";
	else
		echo "[INFO] Updating...";
		whackdroid-update
	fi
elif [[ ${MENU} == '0' ]];
then
	exit
elif [[ ${MENU} == '?' ]];
then
	echo "[INFO] Help & Tools Information";
	echo "-- 0byttt is tools for cracking activity --";
	echo "-- Tools based on BASH Script on Termux  --";
	echo "-- Source privilege by ZeroByte.ID Team  --"
### ADMIN FINDER ###
elif [[ ${MENU} == '1' ]];
then
	echo "[*] Weblogin Finder";
	echo "[?] Insert URL [http://example.com/] : ";
	read URL
	WEBLIB=$(echo ${URL} | sed 's|http://||g' | sed 's|https://||g' | sed 's|/||g');
	WEBDIR="${APPSDIR}/data/${WEBLIB}";
	mkdir ${WEBDIR}

	for PATH in $(cat /data/data/com.termux/files/usr/share/whackdroid/list/loginpath.lst);
	do
		URLS="${URL}/${PATH}";
		HTTPCODE=$(timeout -k 3 3 curl -s -o /dev/null -w "%{http_code}" "${URLS}");
		if [[ ${HTTPCODE} == "200" ]];
			then
			echo "[INFO][${HTTPCODE}] ${URLS} Found!";
			echo "[${HTTPCODE}] ${URLS}" >> ${WEBDIR}/path.txt;
			if [[ $(timeout -k 3 3 curl -s ${URLS} | grep '<input' | grep 'type') =~ 'password' ]];
				then
				echo "[OK] Found a password form!";
				echo "[!] ${URLS}";
				echo "[?] Wanna stop scanning? [y/n] : "
				read CHOOSE
				if [[ ${CHOOSE} == 'y' ]];
					then
					exit;
				fi
			fi
		elif [[ ${HTTPCODE} == "404" ]]; then
			echo "[INFO][${HTTPCODE}] ${URLS}";
		else
			echo "[INFO][${HTTPCODE}] ${URLS}";
			echo "[${HTTPCODE}] ${URLS}" >> ${WEBDIR}/path.txt;
		fi
	done
### REVERSE IP ###
elif [[ ${MENU} == '2' ]];
then
	echo "[*] Reverse IP";
	echo "[*] Powered by YouGetSignal";
	echo "[?] Insert URL [example.com] : ";
	read URLD
	URL=$(echo ${URLD} | sed 's|http://||g' | sed 's|https://||g' | sed 's|/||g');
	REVIPWEBS=$(curl -s -X POST -F "remoteAddress=${URL}" -F "key=" "https://domains.yougetsignal.com/domains.php" | sed 's|\["|\nDomain |g' | sed 's|"|\n|g' | grep 'Domain' | awk '{print $2}');
	if [[ -z ${REVIPWEBS} ]];
		then
		echo "[BAD] Something wrong!";
	else
		i=0;
		for WEB in ${REVIPWEBS}
		do
			((i++));
			echo "[${i}]. ${WEB}";
		done
	fi
else
	echo "Failed to open!";
fi
