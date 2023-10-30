module Env = {
  // [info] https://vercel.com/docs/speed-insights/api#getting-started
  @val @return(nullable)
  external vercelAnalyticsId: option<string> = "import.meta.env.VERCEL_ANALYTICS_ID"

  // [info] https://vercel.com/docs/projects/environment-variables/system-environment-variables#system-environment-variables
  @deriving(jsConverter)
  type vercelEnv = @string
  [
    | #development
    | #preview
    | #production
  ]

  @val @return(nullable)
  external vercelEnv: option<vercelEnv> = "import.meta.env.VERCEL_ENV"
}
