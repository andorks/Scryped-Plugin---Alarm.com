require('dotenv').config();
const { chromium } = require('playwright');

(async () => {
  const browser = await chromium.launchPersistentContext('./user_data', {
    headless: false,
    viewport: { width: 1280, height: 720 },
  });

  const page = await browser.newPage();
  const camUrl = processvars.env.ALARM_CAM_URL;

  await page.goto(camUrl);
  await page.waitForTimeout(3600000); // 1 hour — keep alive for ffmpeg
})();
