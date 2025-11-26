/**
Error boundary component for catching route errors.

Demonstrates:
- useRouteError: Access the error that was thrown
- errorElement prop: This component is used as errorElement in route definitions

This component renders when:
- A loader throws an error
- An action throws an error
- A component in the route tree throws during rendering
*/
@react.component
let make = () => {
  let err = ReactRouter.useRouteError()
  Console.error(err)

  <article>
    <h1> {React.string("Error Page")} </h1>
    <p> {React.string("Something went wrong. Check the console for details.")} </p>
    <ReactRouter.Link to={String("/")}> {React.string("Return to Dashboard")} </ReactRouter.Link>
  </article>
}
