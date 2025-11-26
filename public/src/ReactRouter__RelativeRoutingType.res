/**
Specifies how relative paths should be resolved.
- `Route`: Relative to the route hierarchy (default)
- `Path`: Relative to the current URL pathname
*/
type t = | @as("route") Route | @as("path") Path
