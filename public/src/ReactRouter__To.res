/**
Target destination for navigation.

Can be either:
- `String(path)`: A simple path string like "/dashboard" or "../settings"
- `Path(partialPath)`: An object with pathname, search, and/or hash fields

Examples:
- `String("/dashboard")` - Navigate to /dashboard
- `String("../settings")` - Navigate relative to current route
- `Path({pathname: "/search", search: "?q=hello"})` - Navigate with query params
*/
@unboxed
type t = String(string) | Path(ReactRouter__PartialPath.t)
