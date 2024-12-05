import * as process from "node:process";
import rescript from "@jihchi/vite-plugin-rescript";
import { defineConfig } from "vite";

export default defineConfig({
  base: process.env.CI ? "/rescript-vercel-speed-insights-example/" : "/",
  build: {
    cssMinify: "lightningcss",
  },
  css: {
    transformer: "lightningcss",
  },
  define: {
    "import.meta.env.VERCEL_ANALYTICS_ID": JSON.stringify(
      process.env.VERCEL_ANALYTICS_ID,
    ),
    "import.meta.env.VERCEL_ENV": JSON.stringify(process.env.VERCEL_ENV),
  },
  plugins: [rescript({ silent: true })],
  server: {
    port: 3000,
  },
});
