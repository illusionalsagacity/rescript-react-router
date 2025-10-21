type opaqueRoute

type rec t<'data> = {
  id: string,
  caseSensitive?: bool,
  children?: array<t<'data>>,
  element?: React.element,
  index?: bool,
  path?: string,
  loader?: unit => promise<'data>,
  action?: unknown, // TODO
  errorElement?: React.element,
  hydrateFallbackElement?: React.element,
  // handle?: unknown
  shouldRevalidate?: bool,
  @as("lazy") lazy_?: unit => promise<unknown>,
}

external toOpaque: t<'data> => opaqueRoute = "%identity"
