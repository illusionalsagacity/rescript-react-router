type rec t = {
  caseSensitive?: bool,
  children?: array<t>,
  element?: React.element,
  index?: bool,
  path?: string,
  loader?: 'data. unit => promise<'data>,
  action?: unknown, // TODO
  errorElement?: React.element,
  hydrateFallbackElement?: React.element,
  @as("Component") component?: React.component<{}>,
  @as("ErrorBoundary") errorBoundary?: React.component<{}>,
  // handle?: unknown
  shouldRevalidate?: bool,
  @as("lazy") lazy_?: unit => promise<unknown>,
}
