import * as process from "node:process";
import rescript from "@jihchi/vite-plugin-rescript";
import reactScan from "@react-scan/vite-plugin-react-scan";
import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from "vite-plus";

export default defineConfig({
  define: {
    "import.meta.env.VERCEL_ANALYTICS_ID": JSON.stringify(process.env.VERCEL_ANALYTICS_ID),
    "import.meta.env.VERCEL_ENV": JSON.stringify(process.env.VERCEL_ENV),
  },
  base: process.env.CI ? "/rescript-vercel-speed-insights-example/" : "/",
  plugins: [tailwindcss(), rescript({ silent: true }), reactScan()],
  server: {
    port: 3000,
  },
  lint: {
    options: {
      typeAware: true,
      typeCheck: true,
    },
  },
});
