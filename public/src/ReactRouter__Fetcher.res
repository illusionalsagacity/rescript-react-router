/**
Options for fetcher form submission.
*/
type submitOptions

/**
Fetcher instance for making data mutations without navigation.
Extends PublicFetcher with form component and methods.
- `form`: React component for rendering fetcher forms
- `submit`: Programmatically submit data
- `load`: Trigger a loader without navigation
- `data`: Access the fetcher's loaded data
*/
type t<'state> = {
  ...ReactRouter__PublicFetcher.t,
  form: React.component<ReactRouter__Form.props<'state>>,
}

/**
Programmatically submit data through the fetcher.
*/
@send
external submit: (t<_>, 'data, submitOptions) => unit = "submit"

/**
Trigger the fetcher's loader without navigation.
*/
@send
external load: t<_> => unit = "load"

/**
Access the data returned by the fetcher's loader.
Note: Return type is not type-safe - cast to your expected type.
*/
@get
external data: t<'state> => 'loaderData = "data"
