// let settingsLoader: 'data. unit => Promise.t<'data> = async (type data) => {
//   let response = await Fetch.fetch("/api/settings", {method: #GET})
//   let json = Fetch.Response.json(response)

//   json
// }

// let data = ReactRouter.useRouteLoaderData(settingsRoute)

// let loader: 'data. unit => Promise.t<'data> = () => Promise.resolve("hello")

// let _memoryRouter = ReactRouter.createMemoryRouter(
//   routes,
//   ~options={initialEntries: [String("/dashboard")]},
// )
// let _hashRouter = ReactRouter.createHashRouter(routes)

module App = {
  @react.component
  let make = () => {
    <ReactRouter.RouterProvider router=Routes.browserRouter />
  }
}

@send
external getElementById: (Dom.document, string) => option<Dom.element> = "getElementById"

await SetupMSW.promise

getElementById(document, "root")
->Option.getExn
->ReactDOM.Client.createRoot
->ReactDOM.Client.Root.render(<App />)
