/**
HTTP methods supported by the Form component.
*/
@unboxed
type method =
  | @as("get") Get | @as("post") Post | @as("put") Put | @as("patch") Patch | @as("delete") Delete

/**
Form encoding types for submission data.
- `UrlEncoded`: Standard URL-encoded form data (default)
- `Multipart`: For file uploads
- `Plain`: Plain text
*/
@unboxed
type encType =
  | @as("application/x-www-form-urlencoded") UrlEncoded
  | @as("multipart/form-data") Multipart
  | @as("text/plain") Plain

/**
Props for the Form component.

Key props:
- `method`: HTTP method (Get, Post, Put, Patch, Delete)
- `action`: URL to submit to (defaults to current route)
- `encType`: Form encoding type
- `onSubmit`: Called before submission
- `navigate`: Whether to navigate after submission (default true)
- `fetcherKey`: Key for fetcher if using as a fetcher form
- `replace`: Replace history entry instead of pushing
- `preventScrollReset`: Don't reset scroll after navigation
- `reloadDocument`: Skip client-side handling, do full form post
- `viewTransition`: Enable view transitions for this submission
*/
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

/**
Form component for data mutations with client-side routing.
Submissions trigger route actions and integrate with navigation state.
Use with data routers (createBrowserRouter, etc.).
*/
@module("react-router-dom")
external make: React.component<props<'state>> = "Form"
