type renderProps = {
  isActive: bool,
  isPending: bool,
  isTransitioning: bool,
}

@unboxed
type stringOrRenderPropsFn =
  | String(string)
  | Fn(renderProps => option<string>)

@unboxed
type stylePropType =
  | StyleObj(ReactDOM.Style.t)
  | StyleFn(renderProps => ReactDOM.Style.t)

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
  relative?: RelativeRoutingType.t,
  to: To.t,
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

@module("react-router-dom")
external make: React.component<props<'state>> = "NavLink"
