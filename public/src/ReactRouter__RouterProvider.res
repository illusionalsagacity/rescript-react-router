type props = {
  fallbackElement?: React.element,
  future?: ReactRouter__FutureConfig.t,
  router: ReactRouter__RemixRouter.t,
}

@module("react-router-dom")
external make: React.component<props> = "RouterProvider"
