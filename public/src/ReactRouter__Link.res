/**
Props for the Link component.

Key props:
- `to`: Destination path (required) - can be a string or path object
- `replace`: Replace current history entry instead of pushing
- `state`: State object passed to the destination location
- `reloadDocument`: Skip client-side routing and do a full page reload
- `preventScrollReset`: Don't reset scroll position after navigation
- `relative`: How to resolve relative paths ("route" or "path")
- `viewTransition`: Enable view transitions API for this navigation
*/
type props<'state> = {
  children?: React.element,
  reloadDocument?: bool,
  replace?: bool,
  state?: 'state,
  preventScrollReset?: bool,
  relative?: ReactRouter__RelativeRoutingType.t,
  to: ReactRouter__To.t,
  viewTransition?: bool,
  // Standard anchor attributes
  className?: string,
  disabled?: bool,
  title?: string,
  @as("as") as_?: string,
  @as("data-testid") dataTestId?: string,
  id?: string,
  ref?: ReactDOM.domRef,
  referrerPolicy?: string,
  onFocus?: ReactEvent.Focus.t => unit,
  onBlur?: ReactEvent.Focus.t => unit,
  onClick?: ReactEvent.Mouse.t => unit,
  onPointerDown?: ReactEvent.Pointer.t => unit,
  onPointerUp?: ReactEvent.Pointer.t => unit,
  target?: string,
  rel?: string,
}

/**
Navigation link component that renders an anchor element.
Handles client-side navigation without full page reloads.
*/
@module("react-router-dom")
external make: React.component<props<'state>> = "Link"
