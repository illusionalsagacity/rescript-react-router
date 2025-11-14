@react.component
let make = () => {
  <article>
    <h1> {React.string("Settings")} </h1>
    <ReactRouter.Form method=Post>
      <label htmlFor="full-name">
        {React.string("Full Name")}
        <input type_="text" name="full-name" placeholder="John Doe" />
      </label>
      <button type_="submit"> {React.string("Save")} </button>
    </ReactRouter.Form>
  </article>
}
