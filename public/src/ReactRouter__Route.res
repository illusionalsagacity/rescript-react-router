type loaderOptions = {
  params: Dict.t<string>,
  request: unknown, // TODO
}

type actionOptions = {
  params: Dict.t<string>,
  request: unknown, // TODO
}

type props<'data, 'lazyProps> = {
  // action?: unknown, // TODO
  caseSensitive?: bool,
  children?: React.element,
  element?: React.element,
  errorElement?: React.element,
  @as("lazy") lazy_?: unit => promise<React.component<'lazyProps>>,
  index?: bool,
  path?: string,
  loader?: loaderOptions => promise<'data>,
  shouldRevalidate?: bool,
  // TODO: hydrateFallbackElement?: React.element,
  // handle?: unknown, // TODO
}

@module("react-router-dom")
external make: React.component<props<'data, 'lazyProps>> = "Route"
