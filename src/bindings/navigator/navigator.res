// [info] https://developer.mozilla.org/en-US/docs/Web/API/NetworkInformation
@unboxed
type networkInformation = {effectiveType: option<string>}

// [info] https://developer.mozilla.org/en-US/docs/Web/API/Navigator/connection
@scope("navigator") @val @return(nullable)
external connection: option<networkInformation> = "connection"

// [info] https://developer.mozilla.org/en-US/docs/Web/API/Navigator/sendBeacon
@scope("navigator")
external sendBeacon: (~url: string, ~data: Webapi.Blob.t) => unit = "sendBeacon"
