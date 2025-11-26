// Type for user data returned by the auth check
/**
Example demonstrating protected routes with authentication.

This shows how to:
- Use loader functions to check authentication
- Redirect unauthorized users using the redirect utility
- Access user data from loaders in components
*/
type user = {
  id: string,
  name: string,
  email: string,
}

// Type for the protected route's loader data
type protectedLoaderData = {user: user}

/**
Loader function that checks authentication before allowing access.
Use this pattern in your route's loader to protect routes.

In Routes.res, you would define:
```
let protectedRoute = ReactRouter.RouteObject.Route({
  id: "protected",
  path: "protected",
  element: <ProtectedRoute />,
  loader: ProtectedRoute.loader,
})
```
*/
let loader = async ({request: _, params: _}: ReactRouter.RouteObject.loaderArgs) => {
  // Check if user is authenticated (example: check for auth token)
  // In a real app, you'd check cookies, localStorage, or make an API call
  let isAuthenticated = true // Simulated auth check

  if !isAuthenticated {
    // Redirect to login page if not authenticated
    // The redirect utility creates a Response that the router handles
    ReactRouter.redirect("/login")
  } else {
    // Return user data for the component to use
    Obj.magic({
      user: {
        id: "123",
        name: "John Doe",
        email: "john@example.com",
      },
    })
  }
}

@react.component
let make = () => {
  // Get the user data from the loader
  let data: protectedLoaderData = ReactRouter.useLoaderData()

  <article>
    <h1> {React.string("Protected Content")} </h1>
    <p>
      {React.string("Welcome, ")}
      <strong> {React.string(data.user.name)} </strong>
      {React.string("!")}
    </p>
    <section>
      <h2> {React.string("User Information")} </h2>
      <dl>
        <dt> {React.string("ID")} </dt>
        <dd> {React.string(data.user.id)} </dd>
        <dt> {React.string("Email")} </dt>
        <dd> {React.string(data.user.email)} </dd>
      </dl>
    </section>
    <section>
      <h2> {React.string("How Protected Routes Work")} </h2>
      <p>
        {React.string(
          "This page is protected by a loader function that checks authentication before the component renders. If the user is not authenticated, they are redirected to the login page.",
        )}
      </p>
      <p> {React.string("Key concepts:")} </p>
      <ul>
        <li>
          <strong> {React.string("Loaders run before rendering")} </strong>
          {React.string(" - Authentication is checked server-side (or during navigation)")}
        </li>
        <li>
          <strong> {React.string("redirect() utility")} </strong>
          {React.string(" - Creates a redirect response that the router handles")}
        </li>
        <li>
          <strong> {React.string("useLoaderData()")} </strong>
          {React.string(" - Access authenticated user data in the component")}
        </li>
      </ul>
    </section>
  </article>
}
