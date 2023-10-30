type metric = {
  id: string,
  name: string,
  value: float,
}

@module("web-vitals")
external onCLS: (metric => unit) => unit = "onCLS"

@module("web-vitals")
external onFCP: (metric => unit) => unit = "onFCP"

@module("web-vitals")
external onFID: (metric => unit) => unit = "onFID"

@module("web-vitals")
external onINP: (metric => unit) => unit = "onINP"

@module("web-vitals")
external onLCP: (metric => unit) => unit = "onLCP"

@module("web-vitals")
external onTTFB: (metric => unit) => unit = "onTTFB"
