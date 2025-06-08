# AlarmCam-RTSP

![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![Home Assistant](https://img.shields.io/badge/home--assistant-integrated-orange?style=flat-square)
![License: MIT](https://img.shields.io/badge/license-MIT-green?style=flat-square)


Home Assistant + Docker integration to stream Alarm.com cameras into RTSP (for Scrypted, HomeKit, etc.) using Playwright, Chromium, and FFmpeg. Handles Alarm.com's 2FA by reusing a persistent Chromium profile.

## Features
- Launches Chromium in a virtual display
- Persistent login session via Playwright
- Streams camera view via `ffmpeg` to RTSP
- Integrates with Home Assistant or can run standalone

## 🔧 Quick Start

```bash
git clone https://github.com/YOUR_USERNAME/alarmcam-rtsp.git
cd alarmcam-rtsp
cp vars.env.example vars.env   # Fill in your environment variables
docker build -t alarmcam-rtsp .
docker run --rm -it -v $PWD/user_data:/app/user_data -p 8554:8554 alarmcam-rtsp
```

Then access the stream from:  
```
rtsp://<your-host-ip>:8554/alarmcam
```

1. Clone this repo
2. Create a `vars.env` file:
   ```env
   ALARM_CAM_URL=https://www.alarm.com/web/video/live
   ```
3. Build and run with Docker:
   ```bash
   docker build -t alarmcam-rtsp .
   docker run --rm -it -v $PWD/user_data:/app/user_data -p 8554:8554 alarmcam-rtsp
   ```

## Stream Access
- RTSP URL: `rtsp://<your-host-ip>:8554/alarmcam`

## Home Assistant
Add to `configuration.yaml`:
```yaml
shell_command:
  start_alarm_cam_stream: "docker start alarmcam"
```

## Notes
- Persistent login is stored in `./user_data`
- Requires one-time manual login & 2FA
