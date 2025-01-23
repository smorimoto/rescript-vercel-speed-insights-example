import * as process from "node:process";
import rescript from "@jihchi/vite-plugin-rescript";
import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from "vite";

export default defineConfig({
  base: process.env.CI ? "/rescript-vercel-speed-insights-example/" : "/",
  define: {
    "import.meta.env.VERCEL_ANALYTICS_ID": JSON.stringify(
      process.env.VERCEL_ANALYTICS_ID,
    ),
    "import.meta.env.VERCEL_ENV": JSON.stringify(process.env.VERCEL_ENV),
  },
  plugins: [tailwindcss(), rescript({ silent: true })],
  server: {
    port: 3000,
  },
});
