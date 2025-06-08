# AlarmCam-RTSP

Home Assistant + Docker integration to stream Alarm.com cameras into RTSP (for Scrypted, HomeKit, etc.) using Playwright, Chromium, and FFmpeg. Handles Alarm.com's 2FA by reusing a persistent Chromium profile.

## Features
- Launches Chromium in a virtual display
- Persistent login session via Playwright
- Streams camera view via `ffmpeg` to RTSP
- Integrates with Home Assistant or can run standalone

## Setup
1. Clone this repo
2. Create a `.env` file:
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
