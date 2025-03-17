type loaderOptions = {
  params: Dict.t<string>,
  request: unknown, // TODO
}

// TODO: hydrateFallbackElement?: React.element,
type props = {
  // action?: unknown, // TODO
  caseSensitive?: bool,
  children?: React.element,
  element?: React.element,
  errorElement?: React.element,
  @as("lazy") lazy_?: unit => promise<unknown>,
  index?: bool,
  path?: string,
  loader?: 'data. unit => promise<'data>,
  shouldRevalidate?: bool,
}

@module("react-router-dom")
external make: React.component<props> => React.element = "Route"
