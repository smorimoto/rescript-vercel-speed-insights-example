@inline
let endpoint = "https://vitals.vercel-insights.com/v1/vitals"

let sendToVercelAnalytics = (~metric: WebVitals.metric) => {
  let body = {
    let speed = {
      switch Navigator.connection {
      | Some(connection) =>
        switch connection.effectiveType {
        | Some(effectiveType) => effectiveType
        | None => ""
        }
      | None => ""
      }
    }
    let body = Dict.make()
    // [info] https://vercel.com/docs/speed-insights/api#vitals/measure-web-vitals/body-parameters
    body->Dict.set("dsn", Process.Env.vercelAnalyticsId->Option.getUnsafe)
    body->Dict.set("event_name", metric.name)
    body->Dict.set("href", Webapi.Dom.location->Webapi.Dom.Location.href)
    body->Dict.set("id", metric.id)
    body->Dict.set("page", Webapi.Dom.location->Webapi.Dom.Location.pathname)
    body->Dict.set("speed", speed)
    body->Dict.set("value", metric.value->Float.toString)
    body
  }

  switch Process.Env.vercelAnalyticsId {
  | Some(_) =>
    switch Process.Env.vercelEnv {
    | Some(Production)
    | Some(Preview) =>
      let blob = {
        let blobPart =
          body
          ->Webapi.Url.URLSearchParams.makeWithDict
          ->Webapi.Url.URLSearchParams.toString
          ->Webapi.Blob.stringToBlobPart
        let blobPropertyBag = Webapi.Blob.makeBlobPropertyBag(
          ~_type="application/x-www-form-urlencoded",
          ~endings=#transparent,
          (),
        )
        Webapi.Blob.makeWithOptions([blobPart], blobPropertyBag)
      }
      Navigator.sendBeacon(~url=endpoint, ~data=blob)
    | Some(_)
    | None => {
        let vercelEnv = Process.Env.vercelEnv->Option.getUnsafe->Process.Env.vercelEnvToJs
        `[analytics] invalid value for the environment variable VERCEL_ENV: "${vercelEnv}"`->Console.error
      }
    }
  | None => {
      let vercelAnalyticsId = Process.Env.vercelAnalyticsId->Option.getUnsafe
      let json = {
        let toString = value => JSON.Encode.string(value)
        Dict.mapValues(body, toString)->JSON.Encode.object
      }
      `[analytics] invalid value for the environment variable VERCEL_ANALYTICS_ID: "${vercelAnalyticsId}"`->Console.error
      JSON.stringify(json, ~space=2)->Console.error
    }
  }
}

let webVitals = () => {
  try {
    WebVitals.onCLS(metric => sendToVercelAnalytics(~metric))
    WebVitals.onFCP(metric => sendToVercelAnalytics(~metric))
    WebVitals.onINP(metric => sendToVercelAnalytics(~metric))
    WebVitals.onLCP(metric => sendToVercelAnalytics(~metric))
    WebVitals.onTTFB(metric => sendToVercelAnalytics(~metric))
  } catch {
  | error => error->Console.error
  }
}
