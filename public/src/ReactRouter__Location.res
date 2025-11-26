/**
Location object representing the current URL state.
Extends Path with state and key fields.
- `pathname`: The URL pathname
- `search`: The URL search/query string
- `hash`: The URL hash
- `state`: Location state passed during navigation
- `key`: Unique key for this location entry
*/
type t<'state> = {
  ...ReactRouter__Path.t,
  state: 'state,
  key: string,
}
