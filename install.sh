#!/data/data/com.termux/files/usr/bin/bash

pkg install mlocate;
pkg install curl;
pkg upgrade curl;
updatedb
cp -r ../0byttt-whackdroid/ /data/data/com.termux/files/usr/share/
mv /data/data/com.termux/files/usr/share/0byttt-whackdroid /data/data/com.termux/files/usr/share/whackdroid 
echo "#!/data/data/com.termux/files/usr/bin/bash" >> /data/data/com.termux/files/usr/bin/whackdroid
echo "/data/data/com.termux/files/usr/share/whackdroid/whackdroid.bash" >> /data/data/com.termux/files/usr/bin/whackdroid
chmod -R +x /data/data/com.termux/files/usr/share/whackdroid/
mv /data/data/com.termux/files/usr/share/whackdroid/whackdroid-update.bash /data/data/com.termux/files/usr/share/whackdroid/whackdroid-update
chmod +x /data/data/com.termux/files/usr/bin/whackdroid
chmod +x /data/data/com.termux/files/usr/share/whackdroid/whackdroid-update
