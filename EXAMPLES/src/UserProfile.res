/**
Example demonstrating common React Router hooks:
- useParams: Access URL parameters
- useLocation: Access current location
- useNavigate: Programmatic navigation
*/
@react.component
let make = () => {
  // Get URL parameters (e.g., from route path "/users/:userId")
  let params = ReactRouter.useParams()
  let userId = params->Dict.get("userId")->Option.getOr("unknown")
  let navigate = ReactRouter.useNavigate()

  // Get current location info
  let location = ReactRouter.useLocation()

  // Handle navigation using useNavigate
  // Note: useNavigate returns a function that takes (unit, To.t, ~options=?)
  let handleGoToDashboard = _ => {
    navigate(ReactRouter.To.String("/"))
  }

  let handleGoToSettings = _ => {
    // Navigate with replace (won't add to history)
    navigate(ReactRouter.To.String("/settings"), ~options={replace: true})
  }

  <article>
    <h1> {React.string(`User Profile: ${userId}`)} </h1>
    <section>
      <h2> {React.string("Location Info")} </h2>
      <dl>
        <dt> {React.string("Pathname")} </dt>
        <dd> {React.string(location.pathname)} </dd>
        <dt> {React.string("Search")} </dt>
        <dd> {React.string(location.search)} </dd>
        <dt> {React.string("Hash")} </dt>
        <dd> {React.string(location.hash)} </dd>
        <dt> {React.string("Key")} </dt>
        <dd> {React.string(location.key)} </dd>
      </dl>
    </section>
    <section>
      <h2> {React.string("Navigation")} </h2>
      <p>
        {React.string("Use ")}
        <code> {React.string("useNavigate")} </code>
        {React.string(" for programmatic navigation:")}
      </p>
      <button type_="button" onClick={handleGoToDashboard}>
        {React.string("Go to Dashboard")}
      </button>
      <button type_="button" onClick={handleGoToSettings}>
        {React.string("Go to Settings (replace)")}
      </button>
    </section>
    <section>
      <h2> {React.string("Links with State")} </h2>
      <p> {React.string("Pass state through navigation:")} </p>
      <ReactRouter.Link
        to={ReactRouter.To.String("/dashboard")} state={{"fromProfile": true, "userId": userId}}>
        {React.string("Dashboard (with state)")}
      </ReactRouter.Link>
    </section>
  </article>
}
