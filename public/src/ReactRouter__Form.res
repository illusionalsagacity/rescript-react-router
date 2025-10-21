@unboxed
type method =
  | @as("get") Get | @as("post") Post | @as("put") Put | @as("patch") Patch | @as("delete") Delete

@unboxed
type encType =
  | @as("application/x-www-form-urlencoded") UrlEncoded
  | @as("multipart/form-data") Multipart
  | @as("text/plain") Plain

type props<'state> = {
  // Form specific props
  method?: method,
  encType?: encType,
  action?: string,
  onSubmit?: ReactEvent.Form.t => unit,
  fetcherKey?: string,
  navigate?: bool,
  preventScrollReset?: bool,
  relative?: ReactRouter__RelativeRoutingType.t,
  reloadDocument?: bool,
  replace?: bool,
  state?: 'state,
  viewTransition?: bool,
  // Standard HTML form attributes
  acceptCharset?: string,
  autoComplete?: string,
  className?: string,
  disabled?: bool,
  id?: string,
  name?: string,
  noValidate?: bool,
  target?: string,
  // Children
  children?: React.element,
}

@module("react-router-dom")
external make: React.component<props<'state>> = "Form"
