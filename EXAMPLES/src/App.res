/**
Example application entry point demonstrating React Router setup.

This example uses the data router approach (recommended):
1. Define routes with RouteObject in Routes.res
2. Create a browser router with createBrowserRouter
3. Render RouterProvider with the router instance

Alternative approach (component-based, commented out):
Use BrowserRouter with Routes/Route components for simpler apps
without data loading requirements.
*/
module App = {
  @react.component
  let make = () => {
    // Use RouterProvider with the browser router from Routes.res
    <ReactRouter.RouterProvider router={Routes.browserRouter} />

    // Alternative: Component-based routing (simpler but no data loading)
    // <ReactRouter.BrowserRouter>
    //   <AppRoutes />
    // </ReactRouter.BrowserRouter>
  }
}

@send
external getElementById: (Dom.document, string) => option<Dom.element> = "getElementById"

// Wait for MSW (Mock Service Worker) to be ready before rendering
await SetupMSW.promise

getElementById(document, "root")
->Option.getExn
->ReactDOM.Client.createRoot
->ReactDOM.Client.Root.render(<App />)
