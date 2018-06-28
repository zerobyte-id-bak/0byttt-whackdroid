#!/data/data/com.termux/files/usr/bin/bash

rm -rf /data/data/com.termux/files/usr/share/whackdroid
git clone https://github.com/zerobyte-id/0byttt-whackdroid.git /data/data/com.termux/files/usr/share/whackdroid
chmod -R +x /data/data/com.termux/files/usr/share/whackdroid/
rm -rf /data/data/com.termux/files/usr/share/whackdroid/whackdroid-update.bash
rm -rf /data/data/com.termux/files/usr/share/whackdroid/install.sh
echo "[DONE] Whackdroid Updated [!]...";
