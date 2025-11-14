type staticHandlerContext<'ctx> = {..} as 'ctx

type options = {future?: ReactRouter__FutureConfig.t}

@module("react-router-dom/server")
external createStaticRouter: (
  array<ReactRouter__RouteObject.t>,
  staticHandlerContext<'ctx>,
  ~options: options=?,
) => ReactRouter__RemixRouter.t = "createStaticRouter"
