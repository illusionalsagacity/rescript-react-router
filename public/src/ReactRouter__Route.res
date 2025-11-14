type loaderOptions = {
  params: Dict.t<string>,
  request: Fetch.Request.t,
}

type actionOptions = {
  params: Dict.t<string>,
  request: Fetch.Request.t,
}

type props<'loaderResponse, 'actionResponse, 'lazyProps, 'handle> = {
  action?: actionOptions => promise<'actionResponse>,
  caseSensitive?: bool,
  children?: React.element,
  element?: React.element,
  errorElement?: React.element,
  @as("lazy") lazy_?: unit => promise<React.component<'lazyProps>>,
  index?: bool,
  path?: string,
  loader?: loaderOptions => promise<'loaderResponse>,
  shouldRevalidate?: bool,
  hydrateFallbackElement?: React.element,
  handle?: 'handle,
}

@module("react-router-dom")
external make: React.component<props<'loaderResponse, 'actionResponse, 'lazyProps, 'handle>> =
  "Route"
