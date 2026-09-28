#!/bin/bash
if [ -f /etc/secrets/YOUTUBE_COOKIES_B64 ]; then
  base64 -d /etc/secrets/YOUTUBE_COOKIES_B64 > /tmp/cookies.txt
  chmod 600 /tmp/cookies.txt
fi
if ! test -f "./tuberepair/serverID.txt"; then
    pip3 install -r ./requirements.txt
    useradd tubeuser
    chown -R tubeuser:tubeuser ./tuberepair
fi
su tubeuser
cd ./tuberepair
echo 'Starting TubeRepair'
python3 ./main.py
