/**
Complete path object with all URL components.
- `pathname`: The URL pathname (e.g., "/dashboard")
- `search`: The URL search/query string (e.g., "?q=hello")
- `hash`: The URL hash (e.g., "#section")

Unlike PartialPath, all fields are required and always present.
*/
type t = {
  pathname: string,
  search: string,
  hash: string,
}
