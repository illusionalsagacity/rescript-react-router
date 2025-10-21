type submitOptions

type t<'state> = {
  ...ReactRouter__PublicFetcher.t,
  @meth submit: 'data. ('data, submitOptions) => unit,
  @meth load: string => unit,
  // TODO
  form: React.component<ReactRouter__Form.props<'state>>,
}

// typed as a separate function so that arrays can have different data types
@get external data: t<'state> => 'loaderData = "data"
