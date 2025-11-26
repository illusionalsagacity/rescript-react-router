/**
Options for programmatic navigation via useNavigate or Navigate component.
- `replace`: Replace current history entry instead of pushing new one
- `state`: State object to pass to the destination location
- `preventScrollReset`: Don't reset scroll position after navigation
- `relative`: How to resolve relative paths ("route" or "path")
- `flushSync`: Force synchronous state update (use sparingly)
- `viewTransition`: Enable view transitions API for this navigation
*/
type t<'state> = {
  replace?: bool,
  state?: 'state,
  preventScrollReset?: bool,
  relative?: ReactRouter__RelativeRoutingType.t,
  flushSync?: bool,
  viewTransition?: bool,
}
