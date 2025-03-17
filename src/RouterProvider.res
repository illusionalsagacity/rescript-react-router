type props = {
  fallbackElement?: React.element,
  future?: FutureConfig.t,
  router: RemixRouter.t,
}

@module("react-router-dom")
external make: React.component<props> = "RouterProvider"
