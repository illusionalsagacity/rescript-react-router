type staticHandlerContext<'ctx> = {..} as 'ctx

type options = {future?: FutureConfig.t}

@module("react-router-dom/server")
external createStaticRouter: (
  array<RouteObject.t>, 
  staticHandlerContext<'ctx>, 
  ~options: options=?,
) => RemixRouter.t = "createStaticRouter"
