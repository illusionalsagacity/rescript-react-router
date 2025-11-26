// Type for our newsletter subscription response
/**
Example demonstrating useFetcher for non-navigation data mutations.

Fetchers are useful when you want to:
- Submit data without navigating away
- Have multiple concurrent submissions
- Build "like" buttons, inline edits, etc.
*/
type subscriptionResult = {
  success: bool,
  message: string,
}

let key = "newsletter-fetcher"

@react.component
let make = () => {
  // useFetcher gives you an independent state machine for submissions
  let fetcher = ReactRouter.useFetcher({key: key})

  // Access fetcher state to show loading indicators
  let isSubmitting = fetcher.state == ReactRouter.PublicFetcher.Submitting
  let isLoading = fetcher.state == ReactRouter.PublicFetcher.Loading

  <article>
    <h1> {React.string("Newsletter Subscription")} </h1>
    <p>
      {React.string("This example uses ")}
      <code> {React.string("useFetcher")} </code>
      {React.string(" to submit data without page navigation.")}
    </p>
    <section>
      <h2> {React.string("Subscribe to Newsletter")} </h2>
      // Use the fetcher's form - you can use fetcher.form or React.createElement
      <ReactRouter.Form method=ReactRouter.Form.Post fetcherKey={key} navigate={false}>
        <label htmlFor="email">
          {React.string("Email Address")}
          <input
            type_="email"
            id="email"
            name="email"
            placeholder="you@example.com"
            disabled={isSubmitting}
          />
        </label>
        <button type_="submit" disabled={isSubmitting}>
          {if isSubmitting {
            React.string("Subscribing...")
          } else {
            React.string("Subscribe")
          }}
        </button>
      </ReactRouter.Form>
      // Show loading state
      {if isLoading {
        <p> {React.string("Loading...")} </p>
      } else {
        React.null
      }}
    </section>
    <section>
      <h2> {React.string("Fetcher State")} </h2>
      <dl>
        <dt> {React.string("State")} </dt>
        <dd>
          {React.string(
            switch fetcher.state {
            | ReactRouter.PublicFetcher.Idle => "idle"
            | Submitting => "submitting"
            | Loading => "loading"
            },
          )}
        </dd>
        <dt> {React.string("Form Action")} </dt>
        <dd> {React.string(fetcher.formAction)} </dd>
        <dt> {React.string("Form Method")} </dt>
        <dd> {React.string(fetcher.formMethod)} </dd>
      </dl>
    </section>
  </article>
}
