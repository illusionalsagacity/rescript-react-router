/**
Props for the Navigate component.
- `to`: Destination path or path object (required)
- `replace`: Replace current history entry instead of pushing
- `state`: State object to pass to the new location
- `relative`: How to resolve relative paths
*/
type props<'state> = {
  to: ReactRouter__To.t,
  replace?: bool,
  state?: 'state,
  relative?: ReactRouter__RelativeRoutingType.t,
}

/**
Component that navigates to a new location when rendered.
Use for declarative redirects in your render logic.
For programmatic navigation, use the useNavigate hook instead.
*/
@module("react-router-dom")
external make: React.component<props<'state>> = "Navigate"
