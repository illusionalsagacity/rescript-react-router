/**
Partial path object for navigation with optional fields.
- `pathname`: The URL pathname (e.g., "/dashboard")
- `search`: The URL search/query string (e.g., "?q=hello")
- `hash`: The URL hash (e.g., "#section")

All fields are optional. Omitted fields keep their current values during navigation.
*/
type t = {
  pathname?: string,
  search?: string,
  hash?: string,
}
