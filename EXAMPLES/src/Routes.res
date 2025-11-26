/**
Route definitions for the example application.

This file demonstrates how to:
- Create route objects with loaders and actions
- Set up nested routes with children
- Configure error boundaries
- Use lazy loading for code-splitting
*/
/**
Dashboard route - index route that renders when at the root path.
Uses `index: true` to indicate this is the default child route.
*/
let dashboardRoute = ReactRouter.RouteObject.Route({
  id: "dashboard",
  index: true,
  element: <Dashboard />,
  caseSensitive: true,
})

/**
Settings route - demonstrates loader and action functions.
- loader: Fetches settings data before rendering
- action: Handles form submissions from the Settings component
*/
let settingsRoute = ReactRouter.RouteObject.Route({
  id: "settings",
  path: "settings",
  caseSensitive: true,
  element: <Settings />,
  errorElement: <ErrorRoute />,
  action: async ({request, params}) => {
    Console.log2(request, params)

    Null.null
  },
  loader: async _args => {
    let response = await Fetch.fetch("/api/settings", {method: #GET})

    if !Fetch.Response.ok(response) {
      Error.make("Not ok!")->Error.raise
    }

    switch await Fetch.Response.json(response) {
    | data => data
    | exception _e => Error.make("Json parsing error")->Error.raise
    }
  },
})

/**
User profile route - demonstrates URL parameters with :userId.
Access the userId param via useParams() in the component.
*/
let userProfileRoute = ReactRouter.RouteObject.Route({
  id: "userProfile",
  path: "users/:userId",
  caseSensitive: true,
  element: <UserProfile />,
  errorElement: <ErrorRoute />,
})

/**
Newsletter route - demonstrates useFetcher for non-navigation forms.
*/
let newsletterRoute = ReactRouter.RouteObject.Route({
  id: "newsletter",
  path: "newsletter",
  caseSensitive: true,
  element: <NewsletterForm />,
  errorElement: <ErrorRoute />,
  // Action to handle newsletter subscriptions
  action: async ({request, params}) => {
    // Simulate API call
    Console.log2("Newsletter subscription", {"request": request, "params": params})
    await Promise.make((resolve, _) => {
      let _ = setTimeout(() => resolve({"success": true}), 1000)
    })
  },
})

/**
Protected route - demonstrates authentication with loader redirects.
*/
let protectedRoute = ReactRouter.RouteObject.Route({
  id: "protected",
  path: "protected",
  caseSensitive: true,
  element: <ProtectedRoute />,
  errorElement: <ErrorRoute />,
  loader: ProtectedRoute.loader,
})

/**
Error demonstration route - shows how errorElement catches loader errors.
The loader always rejects, triggering the error boundary.
*/
let errorRoute = ReactRouter.RouteObject.Route({
  id: "error",
  path: "error",
  caseSensitive: true,
  element: <article>
    <h1> {React.string("No Error Page")} </h1>
  </article>,
  errorElement: <ErrorRoute />,
  loader: _args => Error.make("rejected")->Error.toException->Promise.reject,
})

// Root route - wraps all other routes with the Layout component.
// Uses path="/*" to match all paths under root
// children array contains all nested routes
// errorElement catches errors from any child route
let rootRoute = ReactRouter.RouteObject.Route({
  id: "root",
  path: "/*",
  caseSensitive: true,
  element: <Layout />,
  errorElement: <ErrorRoute />,
  children: [
    dashboardRoute,
    settingsRoute,
    userProfileRoute,
    newsletterRoute,
    protectedRoute,
    errorRoute,
  ],
})

/**
Top-level routes array passed to createBrowserRouter.
*/
let routes = [rootRoute]

/**
Browser router instance created from our route configuration.
Pass this to RouterProvider to enable routing.
*/
let browserRouter = ReactRouter.createBrowserRouter(routes)
