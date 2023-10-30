// [info] https://developer.mozilla.org/en-US/docs/Web/API/NetworkInformation
type networkInformation = {effectiveType: option<string>}

// [info] https://developer.mozilla.org/en-US/docs/Web/API/Navigator/connection
@val @scope("navigator") @return(nullable)
external connection: option<networkInformation> = "connection"

// [info] https://developer.mozilla.org/en-US/docs/Web/API/Navigator/sendBeacon
@scope("navigator")
external sendBeacon: (~url: string, ~data: Webapi.Blob.t) => unit = "sendBeacon"
