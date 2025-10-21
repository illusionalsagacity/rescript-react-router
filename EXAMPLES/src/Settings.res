@react.component
let make = () => {
  let data = ReactRouter.useLoaderData()
  Console.log(data)

  <article>
    <h1> {React.string("Settings")} </h1>
  </article>
}
