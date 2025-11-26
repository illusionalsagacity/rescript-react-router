// Type for the data returned by our settings loader
/**
Example demonstrating:
- useLoaderData: Access data loaded by the route's loader function
- useNavigation: Show loading state during form submissions
- Form component: Submit data to route actions
- useActionData: Access data returned by the route's action function

The loader for this route is defined in Routes.res and fetches from /api/settings.
*/
type settingsLoaderData = {"hello": string}

@react.component
let make = () => {
  // Get data from the route's loader function (defined in Routes.res)
  // Note: useLoaderData returns 'a, so we cast to our expected type
  let loaderData: settingsLoaderData = ReactRouter.useLoaderData()

  // Get current navigation state to show loading indicators
  let navigation = ReactRouter.useNavigation()

  // Check if we're currently submitting
  let isSubmitting = navigation.state == ReactRouter.NavigationState.Submitting

  // Get action data (result of form submission, if any)
  let actionData = ReactRouter.useActionData()

  <article>
    <h1> {React.string("Settings")} </h1>
    <section>
      <h2> {React.string("Loader Data")} </h2>
      <p>
        {React.string("Data from loader: ")}
        <code> {React.string(loaderData["hello"])} </code>
      </p>
    </section>
    <section>
      <h2> {React.string("Update Settings")} </h2>
      // Form submits to the route's action function (defined in Routes.res)
      <ReactRouter.Form method=ReactRouter.Form.Post>
        <label htmlFor="full-name">
          {React.string("Full Name")}
          <input
            type_="text"
            id="full-name"
            name="full-name"
            placeholder="John Doe"
            disabled={isSubmitting}
          />
        </label>
        <button type_="submit" disabled={isSubmitting}>
          {if isSubmitting {
            React.string("Saving...")
          } else {
            React.string("Save")
          }}
        </button>
      </ReactRouter.Form>
      // Show action result if available
      {switch actionData {
      | Some(_) =>
        <p className="success-message"> {React.string("Settings saved successfully!")} </p>
      | None => React.null
      }}
    </section>
    <section>
      <h2> {React.string("Navigation State")} </h2>
      <p>
        {React.string("Current state: ")}
        <code>
          {React.string(
            switch navigation.state {
            | ReactRouter.NavigationState.Idle => "idle"
            | Loading => "loading"
            | Submitting => "submitting"
            },
          )}
        </code>
      </p>
    </section>
  </article>
}
