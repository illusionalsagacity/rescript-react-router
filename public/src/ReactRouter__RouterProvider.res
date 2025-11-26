/**
Props for the RouterProvider component.
- `router`: Router instance from createBrowserRouter, createHashRouter, etc. (required)
- `fallbackElement`: Element to show while the router is loading
- `future`: Feature flags for upcoming React Router features
*/
type props = {
  fallbackElement?: React.element,
  future?: ReactRouter__FutureConfig.t,
  router: ReactRouter__RemixRouter.t,
}

/**
Top-level component that provides routing context for data routers.
Wrap your app with this component and pass the router from createBrowserRouter.
*/
@module("react-router-dom")
external make: React.component<props> = "RouterProvider"
