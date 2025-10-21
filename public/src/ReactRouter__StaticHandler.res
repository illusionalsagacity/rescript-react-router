type t

type options = {
  basename?: string,
  future?: ReactRouter__FutureConfig.t,
  // Omitting detectErrorBoundary and mapRouteProperties as specified in the type definition
}

@module("react-router-dom/server")
external createStaticHandler: (array<ReactRouter__RouteObject.t<'data>>, ~options: options=?) => t =
  "createStaticHandler"
