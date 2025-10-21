let dashboardRoute = {
  ReactRouter.RouteObject.id: "dashboard",
  path: "dashboard",
  element: <Dashboard />,
  caseSensitive: true,
}

let settingsRoute = {
  ReactRouter.RouteObject.id: "settings",
  path: "settings",
  caseSensitive: true,
  element: <Settings />,
  errorElement: <ErrorRoute />,
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
}

let errorRoute = {
  ReactRouter.RouteObject.id: "error",
  path: "error",
  caseSensitive: true,
  element: <article>
    <h1> {React.string("No Error Page")} </h1>
  </article>,
  errorElement: <ErrorRoute />,
  loader: _args => Error.make("rejected")->Error.toException->Promise.reject,
}

let rootRoute = {
  ReactRouter.RouteObject.id: "root",
  path: "/",
  caseSensitive: true,
  element: <Layout />,
  errorElement: <ErrorRoute />,
  children: [dashboardRoute, settingsRoute, errorRoute],
}

let routes = [rootRoute]

let browserRouter = ReactRouter.createBrowserRouter(routes)
