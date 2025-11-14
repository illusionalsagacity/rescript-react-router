type submitOptions

type t<'state> = {
  ...ReactRouter__PublicFetcher.t,
  form: React.component<ReactRouter__Form.props<'state>>,
}

@send external submit: (t<_>, 'data, submitOptions) => unit = "submit"
@send external load: t<_> => unit = "load"

// typed as a separate function so that arrays can have different data types
@get external data: t<'state> => 'loaderData = "data"
