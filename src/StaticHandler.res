type t

type options = {
  basename?: string,
  future?: FutureConfig.t,
  // Omitting detectErrorBoundary and mapRouteProperties as specified in the type definition
}

@module("react-router-dom/server")
external createStaticHandler: (array<RouteObject.t<'data>>, ~options: options=?) => t =
  "createStaticHandler"
