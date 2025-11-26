/**
Props passed to NavLink render functions for className and style.
- `isActive`: True when the link matches the current URL
- `isPending`: True when a navigation to this link is in progress
- `isTransitioning`: True during a view transition to this link
*/
type renderProps = {
  isActive: bool,
  isPending: bool,
  isTransitioning: bool,
}

/**
ClassName prop that can be either a static string or a function
that receives renderProps and returns an optional string.
*/
@unboxed
type stringOrRenderPropsFn =
  | String(string)
  | Fn(renderProps => option<string>)

/**
Style prop that can be either a static style object or a function
that receives renderProps and returns a style object.
*/
@unboxed
type stylePropType =
  | StyleObj(ReactDOM.Style.t)
  | StyleFn(renderProps => ReactDOM.Style.t)

/**
Props for the NavLink component.

NavLink-specific props:
- `caseSensitive`: Match URL case-sensitively
- `className`: Static string or function receiving renderProps
- `end`: Only match if this is the "end" of the URL (no child routes)
- `style`: Static style or function receiving renderProps

Inherits all Link props for navigation behavior.
*/
type props<'state> = {
  // NavLink specific props
  caseSensitive?: bool,
  className?: stringOrRenderPropsFn,
  end?: bool,
  style?: stylePropType,
  children?: React.element,
  // Inherited from Link but explicitly omitted in NavLinkProps
  // className, style, and children are handled separately above

  // Link props
  reloadDocument?: bool,
  replace?: bool,
  state?: 'state,
  preventScrollReset?: bool,
  relative?: ReactRouter__RelativeRoutingType.t,
  to: ReactRouter__To.t,
  viewTransition?: bool,
  // Standard anchor attributes
  @as("data-testid") dataTestId?: string,
  id?: string,
  ref?: ReactDOM.domRef,
  onFocus?: ReactEvent.Focus.t => unit,
  onBlur?: ReactEvent.Focus.t => unit,
  onClick?: ReactEvent.Mouse.t => unit,
  onPointerDown?: ReactEvent.Pointer.t => unit,
  onPointerUp?: ReactEvent.Pointer.t => unit,
  target?: string,
  rel?: string,
}

/**
Special Link component that knows whether it's "active" or "pending".
Perfect for building navigation menus, tabs, and breadcrumbs.
*/
@module("react-router-dom")
external make: React.component<props<'state>> = "NavLink"
