type props<'state> = {
  children?: React.element,
  reloadDocument?: bool,
  replace?: bool,
  state?: 'state,
  preventScrollReset?: bool,
  relative?: RelativeRoutingType.t,
  to: To.t,
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
  // Add any other HTML anchor attributes you commonly use
}

@module("react-router-dom")
external make: React.component<props<'state>> = "Link"
