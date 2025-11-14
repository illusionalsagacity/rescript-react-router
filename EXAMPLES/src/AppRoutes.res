@react.component
let make = () => {
  <ReactRouter.Routes>
    <ReactRouter.Route path="/" element={<Layout />} errorElement={<ErrorRoute />}>
      <ReactRouter.Route index=true lazy_={() => import(Dashboard.make)} />
      <ReactRouter.Route
        path="settings" errorElement={<ErrorRoute />} lazy_={() => import(Settings.make)}
      />
      <ReactRouter.Route
        path="error"
        element={<article>
          <h1> {React.string("No Error Page")} </h1>
        </article>}
        errorElement={<ErrorRoute />}
      />
    </ReactRouter.Route>
  </ReactRouter.Routes>
}
