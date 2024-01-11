module Env = {
  // [info] https://vercel.com/docs/speed-insights/api#getting-started
  @val @return(nullable)
  external vercelAnalyticsId: option<string> = "import.meta.env.VERCEL_ANALYTICS_ID"

  // [info] https://vercel.com/docs/projects/environment-variables/system-environment-variables#system-environment-variables
  @live
  type vercelEnv =
    | @as("development") Development
    | @as("preview") Preview
    | @as("production") Production

  let vercelEnvToJs = vercelEnv =>
    switch vercelEnv {
    | Development => "development"
    | Preview => "preview"
    | Production => "production"
    }

  @val @return(nullable)
  external vercelEnv: option<vercelEnv> = "import.meta.env.VERCEL_ENV"
}
