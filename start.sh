#!/bin/bash
export DISPLAY=:99

echo "[🔥] Starting virtual display..."
Xvfb :99 -screen 0 1280x720x24 &
sleep 3

echo "[🌐] Launching Chromium to render Alarm.com camera..."
node alarmcam.js &

echo "[📡] Waiting for camera page to load..."
sleep 20

echo "[🎥] Starting RTSP stream on rtsp://0.0.0.0:8554/alarmcam"
ffmpeg -f x11grab -video_size 1280x720 -i :99 \
  -c:v libx264 -preset ultrafast -tune zerolatency \
  -f rtsp rtsp://0.0.0.0:8554/alarmcam
