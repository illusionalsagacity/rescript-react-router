type staticHandlerContext<'a> = {..} as 'a

type props<'ctx> = {
  context: staticHandlerContext<'ctx>,
  router: ReactRouter__RemixRouter.t,
  hydrate?: bool,
  nonce?: string,
}

@module("react-router-dom/server")
external make: React.component<props<'ctx>> = "StaticRouterProvider"
