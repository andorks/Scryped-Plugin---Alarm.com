#!/bin/bash
if [ ! -d "./user_data" ]; then
  echo "[🔐] First-time setup. Launching browser for 2FA login."
  export DISPLAY=:99
  Xvfb :99 -screen 0 1280x720x24 &
  sleep 3
  node alarmcam.js
  echo "[✅] Complete your 2FA in the browser. Then Ctrl+C to stop."
else
  ./start.sh
fi
