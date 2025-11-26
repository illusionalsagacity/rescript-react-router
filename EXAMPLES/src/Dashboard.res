/**
Dashboard component - the default route (index route).

Demonstrates:
- Using Link component for navigation
- The String variant of the To type for simple paths
*/
@react.component
let make = () => {
  <article>
    <h1> {React.string("Dashboard")} </h1>
    <p>
      {React.string("Welcome to the dashboard! Click ")}
      <ReactRouter.Link to={String("/settings")}> {React.string("here")} </ReactRouter.Link>
      {React.string(" to go to the settings page.")}
    </p>
  </article>
}
