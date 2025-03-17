type submitOptions

type t = {
  ...PublicFetcher.t,
  @meth submit: 'data. ('data, submitOptions) => unit,
  @meth load: string => unit,
  // TODO
  // form: React.component<FetcherForm.props<'loaderData>>,
}

// typed as a separate function so that arrays can have different data types
@get external data: t => 'loaderData = "data"
