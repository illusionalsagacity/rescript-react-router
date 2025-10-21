@react.component
let make = () => {
  let err = ReactRouter.useRouteError()
  Console.error(err)

  <article>
    <h1> {React.string("Error Page")} </h1>
  </article>
}
