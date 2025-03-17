module Layout = {
  @react.component
  let make = () => {
    <>
      <nav>
        <NavLink style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/"})}>
          {React.string("Home")}
        </NavLink>
        <NavLink style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/dashboard"})}>
          {React.string("Dashboard")}
        </NavLink>
        <NavLink style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/settings"})}>
          {React.string("Settings")}
        </NavLink>
        <NavLink style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/error"})}>
          {React.string("Error")}
        </NavLink>
      </nav>
      <main>
        <Outlet />
      </main>
    </>
  }
}

module Dashboard = {
  @react.component
  let make = () => {
    <article>
      <h1> {React.string("Dashboard")} </h1>
    </article>
  }
}

module Settings = {
  @react.component
  let make = () => {
    <article>
      <h1> {React.string("Settings")} </h1>
    </article>
  }
}

module ErrorRoute = {
  @react.component
  let make = () => {
    let err = ReactRouter.useRouteError()

    Console.error(err)

    <article>
      <h1> {React.string("Error Page")} </h1>
    </article>
  }
}

// let settingsLoader: 'data. unit => Promise.t<'data> = async (type data) => {
//   let response = await Fetch.fetch("/api/settings", {method: #GET})
//   let json = Fetch.Response.json(response)

//   json
// }

let settingsRoute = {
  RouteObject.id: "settings",
  path: "settings",
  caseSensitive: true,
  element: <Settings />,
  loader: async () => {
    let response = await Fetch.fetch("/api/settings", {method: #GET})

    switch await Fetch.Response.json(response) {
    | data => data
    | exception _e => Error.make("Json parsing error")->Error.raise
    }
  },
}

// let data = ReactRouter.useRouteLoaderData(settingsRoute)

// let loader: 'data. unit => Promise.t<'data> = () => Promise.resolve("hello")

let routes = [
  {
    RouteObject.id: "root",
    path: "/",
    caseSensitive: true,
    element: <Layout />,
    errorElement: <ErrorRoute />,
    children: [
      {
        id: "dashboard",
        path: "dashboard",
        element: <Dashboard />,
        caseSensitive: true,
      },
      {
        id: "settings",
        path: "settings",
        caseSensitive: true,
        element: <Settings />,
        errorElement: <ErrorRoute />,
        loader: async () => {
          let response = await Fetch.fetch("/api/settings", {method: #GET})

          if !Fetch.Response.ok(response) {
            Error.make("Not ok!")->Error.raise
          }

          switch await Fetch.Response.json(response) {
          | data => data
          | exception _e => Error.make("Json parsing error")->Error.raise
          }
        },
      },
      {
        id: "error",
        path: "error",
        caseSensitive: true,
        element: <article>
          <h1> {React.string("No Error Page")} </h1>
        </article>,
        errorElement: <ErrorRoute />,
        loader: () => Error.make("rejected")->Error.toException->Promise.reject,
      },
    ],
  },
]

let browserRouter = ReactRouter.createBrowserRouter(routes)
let memoryRouter = ReactRouter.createMemoryRouter(
  routes,
  ~options={initialEntries: [String("/dashboard")]},
)
let hashRouter = ReactRouter.createHashRouter(routes)

module App = {
  @react.component
  let make = () => {
    <RouterProvider router=browserRouter />
  }
}

@send
external getElementById: (Dom.document, string) => option<Dom.element> = "getElementById"

getElementById(document, "root")
->Option.getExn
->ReactDOM.Client.createRoot
->ReactDOM.Client.Root.render(<App />)
