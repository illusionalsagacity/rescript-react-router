@react.component
let make = () => {
  <ReactRouter.Routes>
    <ReactRouter.Route path="/" element={<Layout />} errorElement={<ErrorRoute />}>
      <ReactRouter.Route index=true element={<Dashboard />} />
      <ReactRouter.Route path="settings" element={<Settings />} errorElement={<ErrorRoute />} />
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
